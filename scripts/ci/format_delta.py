#!/usr/bin/env python3
"""`dart format` changes that touch the lines a branch added or changed.

The repo isn't format-clean, so running the formatter over a whole file would
flag lines nobody in the PR touched. This formats each changed .dart file as it
is at HEAD, diffs that against the file, and keeps only the hunks that overlap
lines the diff between BASE and HEAD added or changed. A file the formatter
can't parse is reported as unchecked. It never rewrites anything and exits 0
whatever it finds.

Example: scripts/ci/format_delta.py upstream/main HEAD --out format.json
"""

import argparse
import difflib
import json
import os
import re
import subprocess
import sys

sys.dont_write_bytecode = True  # no __pycache__ next to the scripts
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from touched_lines_diagnostics import changed_ranges, git, repo_root  # noqa: E402

MAX_ITEMS = 30
HUNK = re.compile(r'^@@ -(\d+)(?:,(\d+))? \+\d+(?:,\d+)? @@')


def formatted(root, path, source):
    """The file run through dart format, or None if it doesn't parse. stdin with
    --stdin-name so the file's package config still sets the language version."""
    proc = subprocess.run(['dart', 'format', '--output=show', '--summary=none', '--stdin-name', path],
                          cwd=root, input=source, capture_output=True, text=True)
    if proc.returncode != 0:
        print(f'warning: dart format could not format {path}: {proc.stderr.strip()[:300]}', file=sys.stderr)
        return None
    return proc.stdout


def git_lines(text):
    """The lines as git numbers them. splitlines() would also break on
    U+2028 and the like and put the hunks off by a line."""
    lines = text.split('\n')
    if lines and lines[-1] == '':  # what follows the final \n isn't a line
        lines.pop()
    return lines


def format_hunks(original, result):
    """(first, last) original-side line ranges of each formatter change. An
    insertion with no original lines is placed on the line before it."""
    hunks = []
    diff = difflib.unified_diff(git_lines(original), git_lines(result), n=0, lineterm='')
    for line in diff:
        m = HUNK.match(line)
        if m:
            start, count = int(m.group(1)), int(m.group(2) or 1)
            hunks.append((max(start, 1), max(start, 1) + max(count, 1) - 1))
    return hunks


def main():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('base', help='base ref, e.g. upstream/main or origin/main')
    parser.add_argument('head', nargs='?', default='HEAD', help='head ref (default HEAD)')
    parser.add_argument('--out', help='write the JSON result to this file')
    args = parser.parse_args()

    root = repo_root()
    ranges = {p: r for p, r in changed_ranges(args.base, args.head, cwd=root).items() if r}

    items, files, unchecked = [], set(), []
    for path, touched in sorted(ranges.items()):
        try:
            source = git('show', f'{args.head}:{path}', cwd=root)
        except subprocess.CalledProcessError as e:
            print(f'warning: could not read {path} at {args.head}: {(e.stderr or "").strip()[:300]}',
                  file=sys.stderr)
            unchecked.append(path)
            continue
        result = formatted(root, path, source)
        if result is None:
            unchecked.append(path)
            continue
        for first, last in format_hunks(source, result):
            # A formatter hunk can start on an untouched line, so point at the
            # first touched line inside it.
            hits = [max(first, t_first) for t_first, t_last in touched if first <= t_last and t_first <= last]
            if hits:
                files.add(path)
                items.append({'file': path, 'line': min(hits)})

    # A file the formatter rejected wasn't checked, so it's listed rather
    # than passed off as formatted.
    result = {'files': len(files), 'hunks': len(items), 'unchecked': unchecked, 'items': items[:MAX_ITEMS]}
    if args.out:
        with open(args.out, 'w') as f:
            json.dump(result, f, indent=2)

    print(f'{len(items)} dart format hunks on lines changed since {args.base}, in {len(files)} files '
          f'({len(ranges) - len(unchecked)} of {len(ranges)} changed .dart files checked)')
    for item in items:
        print(f"  {item['file']}:{item['line']}")
    if items:
        print('Run `dart format <file>` and keep only the hunks on your own lines.')
    if unchecked:
        print(f'{len(unchecked)} changed files dart format could not check, see the warnings above:')
        for path in unchecked:
            print(f'  {path}')


if __name__ == '__main__':
    try:
        main()
    except subprocess.CalledProcessError as e:
        sys.exit(f"error: {' '.join(e.cmd)} failed: {(e.stderr or '').strip()}")
