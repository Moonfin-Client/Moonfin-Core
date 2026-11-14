#!/usr/bin/env python3
"""Analyzer diagnostics on the lines a branch added or changed.

The tree carries a few hundred longstanding infos and warnings, so a plain
`dart analyze` can't tell a contributor what their own change introduced. This
keeps only the diagnostics that land on lines the diff between BASE and HEAD
added or changed, infos included. It is advisory: it exits 0 whatever it finds.

The analyzer runs on the working tree, so check out HEAD first (CI does). Run
`flutter pub get` in the app and in the packages beforehand, as for CI.

Example: scripts/ci/touched_lines_diagnostics.py upstream/main HEAD --out diag.json
"""

import argparse
import json
import os
import re
import subprocess
import sys

MAX_ITEMS = 30
HUNK = re.compile(r'^@@ -\d+(?:,\d+)? \+(\d+)(?:,(\d+))? @@')


def git(*args, cwd=None):
    return subprocess.run(['git', '-c', 'core.quotePath=false', *args], cwd=cwd, check=True,
                          capture_output=True, text=True).stdout


def repo_root():
    return os.path.realpath(git('rev-parse', '--show-toplevel').strip())


def changed_ranges(base, head, pattern='*.dart', cwd=None, ignore_whitespace=False):
    """{path: [(first, last), ...]} of the lines HEAD added or changed since its
    merge base with BASE. Pure deletions leave no range. Deleted files are left out.
    With ignore_whitespace, a line whose only change is whitespace doesn't count."""
    out = git('diff', '-U0', '--no-color', '--no-ext-diff', '--diff-filter=d',
              *(['-w'] if ignore_whitespace else []),
              f'{base}...{head}', '--', pattern, cwd=cwd)
    ranges = {}
    path = None
    for line in out.splitlines():
        if line.startswith('+++ '):
            target = line[4:]
            path = target[2:] if target.startswith('b/') else None
            if path is not None:
                ranges.setdefault(path, [])
        elif path is not None and line.startswith('@@'):
            m = HUNK.match(line)
            if m:
                start, count = int(m.group(1)), int(m.group(2) or 1)
                if count > 0:
                    ranges[path].append((start, start + count - 1))
    return ranges


def in_ranges(line, ranges):
    return any(first <= line <= last for first, last in ranges)


def workflow_packages(root):
    """The package list the CI analyzer suite uses, read from the workflow the
    same way scripts/ci-check.sh does, so there's one copy of it."""
    for name in ('checks.yml', 'build.yml'):
        try:
            with open(os.path.join(root, '.github', 'workflows', name)) as f:
                for line in f:
                    m = re.match(r'\s*packages="([^"]+)"', line)
                    if m:
                        return m.group(1).split()
        except OSError:
            pass
    return []


def split_machine(line):
    """SEVERITY|TYPE|CODE|FILE|LINE|COL|LENGTH|MESSAGE, with \\ escaping."""
    fields, cur, i = [], [], 0
    while i < len(line):
        c = line[i]
        if c == '\\' and i + 1 < len(line):
            cur.append(line[i + 1])
            i += 2
            continue
        if c == '|':
            fields.append(''.join(cur))
            cur = []
        else:
            cur.append(c)
        i += 1
    fields.append(''.join(cur))
    return fields


def analyze(cwd):
    # The whole directory, not just the changed files: given a file inside a
    # package, dart analyze switches to that package's options and drops the
    # lints the root run applies to it.
    proc = subprocess.run(['dart', 'analyze', '--format=machine'], cwd=cwd,
                          capture_output=True, text=True)
    found = []
    for line in proc.stdout.splitlines():
        fields = split_machine(line)
        if len(fields) < 8 or not fields[4].isdigit():
            continue
        found.append({
            'file': os.path.realpath(os.path.join(cwd, fields[3])),
            'line': int(fields[4]),
            'col': fields[5],
            'severity': fields[0].lower(),
            'code': fields[2].lower(),
            'message': '|'.join(fields[7:]),
        })
    # 1 to 3 mean it found infos, warnings or errors. Anything else is a
    # crash, and whatever it printed first is incomplete: stop before the
    # result is written, so the PR comment says the check didn't run rather
    # than passing a partial list off as the whole of it.
    if proc.returncode not in (0, 1, 2, 3):
        sys.exit(f'error: dart analyze in {cwd} exited {proc.returncode}: {proc.stderr.strip()[:500]}')
    return found


def warn_if_not_checked_out(head, files, root):
    try:
        if git('rev-parse', head + '^{commit}').strip() != git('rev-parse', 'HEAD').strip():
            print(f'warning: {head} is not checked out, analyzing the working tree anyway', file=sys.stderr)
        elif git('status', '--porcelain', '--', *files, cwd=root).strip():
            print('warning: some changed files have uncommitted edits, line numbers may be off',
                  file=sys.stderr)
    except subprocess.CalledProcessError:
        pass


def main():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('base', help='base ref, e.g. upstream/main or origin/main')
    parser.add_argument('head', nargs='?', default='HEAD', help='head ref (default HEAD)')
    parser.add_argument('--out', help='write the JSON result to this file')
    args = parser.parse_args()

    root = repo_root()
    ranges = {p: r for p, r in changed_ranges(args.base, args.head, cwd=root).items()
              if r and os.path.isfile(os.path.join(root, p))}
    if ranges:
        warn_if_not_checked_out(args.head, list(ranges), root)

    # The root run covers the whole tree. A listed package also gets its own
    # run, from its own directory, as the CI analyzer suite does.
    dirs = [root] + [os.path.join(root, 'packages', pkg) for pkg in workflow_packages(root)
                     if any(p.startswith(f'packages/{pkg}/') for p in ranges)]

    items, seen = [], set()
    if ranges:
        for cwd in dirs:
            for d in analyze(cwd):
                rel = os.path.relpath(d['file'], root)
                key = (rel, d['line'], d['col'], d['code'])
                if rel in ranges and in_ranges(d['line'], ranges[rel]) and key not in seen:
                    seen.add(key)
                    items.append({'file': rel, 'line': d['line'], 'severity': d['severity'],
                                  'code': d['code'], 'message': d['message']})
    items.sort(key=lambda d: (d['file'], d['line'], d['code']))

    result = {'count': len(items), 'items': items[:MAX_ITEMS]}
    if args.out:
        with open(args.out, 'w') as f:
            json.dump(result, f, indent=2)

    print(f'{len(items)} analyzer diagnostics on lines changed since {args.base} '
          f'({len(ranges)} changed .dart files)')
    for d in items:
        print(f"  {d['file']}:{d['line']} {d['severity']} {d['code']} {d['message']}")


if __name__ == '__main__':
    try:
        main()
    except subprocess.CalledProcessError as e:
        sys.exit(f"error: {' '.join(e.cmd)} failed: {(e.stderr or '').strip()}")
