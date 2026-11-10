#!/usr/bin/env python3
"""Which of a branch's changed lines the tests run.

Reports the lines under lib/ (the app's and each package's) that the diff
between BASE and HEAD adds or changes, and which of them some test runs, so a
reviewer can see how much of the change the test suite exercises at all. It
also reports how many of them the branch's own new or changed tests run.

Two stages, so the usual small pull request stays fast:
1. The test files the branch adds or changes, one process each, as CI runs
   them, plus a generated test that only imports the changed files, so every
   changed file has its executable lines in the coverage data. If these
   already run every changed line, no other test can add anything.
2. Otherwise the rest of the app's test suite, bundled into a few generated
   files (a group per test file) because coverage costs a slow warm-up per
   process. Files that fail when bundled, usually because they share state
   with another file, are run again on their own, and a bundle that doesn't
   load or crashes has all its files run on their own. The packages' suites
   run as they are, when the branch changes package code.

Bundling makes a few lines differ from running each file on its own: measured
on the whole suite, 7 of 113,000 lines fewer and 120 more. Close enough for a
review aid, at a fifth of the time.

It is advisory: it exits 0 whatever it finds, and non-zero only when no test
run left coverage to read, so a crash doesn't pass for a result. The result
file is written after stage 1 too, marked partial, so a run that times out
during stage 2 still leaves what it had.

Run it from a checkout of HEAD (CI does), after `flutter pub get` in the app
and in the packages, as for CI.

Example: scripts/ci/changed_lines_coverage.py upstream/main HEAD --out cov.json
"""

import argparse
import glob
import json
import os
import re
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from touched_lines_diagnostics import changed_ranges, git, repo_root, workflow_packages  # noqa: E402

MAX_OWN_TEST_FILES = 25
BUNDLES = 4
MAX_FILES = 15
MAX_RANGES = 10
MAX_ANNOTATIONS = 10
GENERATED_PREFIX = '_changed_lines_coverage_'
IMPORTS_TEST = f'{GENERATED_PREFIX}imports_test.dart'
IMPORTS_TEST_NAME = 'changed_lines_coverage loads the changed files'

TEST_FILE = re.compile(r'^(?:packages/([^/]+)/)?test/.+_test\.dart$')
TEST_DIR_DART = re.compile(r'^(?:packages/[^/]+/)?test/.+\.dart$')
LIB_FILE = re.compile(r'^(?:packages/[^/]+/)?lib/.+\.dart$')
GENERATED = re.compile(r'(\.g|\.freezed|\.mocks)\.dart$|^lib/l10n/')
# A VM test can never load these, so they're named rather than counted.
WEB_ONLY = re.compile(r"""^\s*import\s+['"](dart:js_interop|dart:html|dart:js|dart:ui_web|"""
                      r"""package:web/|package:flutter_web_plugins/)""", re.M)
MAIN = re.compile(r'^\s*(?:Future<void>|void)\s+main\s*\(', re.M)
# Test files that can't share a process with others: one that sets up its own
# binding, since a process has one, one with a library annotation such as
# @TestOn or @Tags, which a bundle would drop, and one with an async main(),
# since a group body may not be async.
OWN_BINDING = re.compile(r'\b[A-Za-z]+Binding\.ensureInitialized\(\)')
TEST_BINDING = re.compile(r'^\s*(?:TestWidgetsFlutterBinding|AutomatedTestWidgetsFlutterBinding)'
                          r'\.ensureInitialized', re.M)
LIBRARY_ANNOTATION = re.compile(r'^@(?:TestOn|Tags|Skip|Timeout|OnPlatform)\b', re.M)
ASYNC_MAIN = re.compile(r'^\s*(?:Future<void>\s+main\s*\(|(?:void\s+)?main\s*\([^)]*\)\s*async\b)', re.M)


def read(root, path):
    try:
        with open(os.path.join(root, path), encoding='utf-8', errors='replace') as f:
            return f.read()
    except OSError:
        return ''


def local_packages(root):
    """{directory under packages/: package name}, for --coverage-package, so
    code an app test runs in a package counts too, and for package: imports."""
    names = {}
    for pubspec in glob.glob(os.path.join(root, 'packages', '*', 'pubspec.yaml')):
        m = re.search(r'^name:\s*(\S+)', read(root, os.path.relpath(pubspec, root)), re.M)
        if m:
            names[os.path.basename(os.path.dirname(pubspec))] = m.group(1)
    return names


def package_uri(path, packages):
    """lib/a/b.dart -> package:moonfin/a/b.dart, packages/x/lib/c.dart ->
    package:<x's name>/c.dart."""
    m = re.match(r'^(?:packages/([^/]+)/)?lib/(.+)$', path)
    name = packages.get(m.group(1)) if m.group(1) else 'moonfin'
    return f'package:{name}/{m.group(2)}' if name else None


def write_imports_test(root, lib_files, packages):
    """A test file that only imports the changed lib files. Importing runs none
    of their code, but a loaded library gets every executable line in the lcov
    file, so a changed file no test loads shows as lines not run rather than
    missing. A part file can't be imported and is left out. Returns its path
    relative to root, or None."""
    uris = sorted(u for u in (package_uri(p, packages) for p in lib_files
                              if not re.search(r'^\s*part\s+of\b', read(root, p), re.M)) if u)
    if not uris:
        return None
    path = os.path.join('test', IMPORTS_TEST)
    with open(os.path.join(root, path), 'w') as f:
        f.write('// Generated by scripts/ci/changed_lines_coverage.py, delete if left behind.\n')
        f.write('// ignore_for_file: unused_import\n')
        f.write("import 'package:flutter_test/flutter_test.dart';\n")
        f.writelines(f"import '{u}';\n" for u in uris)
        f.write(f"\nvoid main() {{\n  test('{IMPORTS_TEST_NAME}', () {{}});\n}}\n")
    return path


def changed_test_files(base, head, root):
    """The *_test.dart files the branch added or changed that CI runs, and the
    ones it added that CI never runs: a .dart file under a test directory with
    a main() whose name doesn't end in _test.dart, or a test in a package the
    Checks workflow doesn't test."""
    ci_packages = set(workflow_packages(root))
    out = git('diff', '--name-only', '--no-renames', '--diff-filter=AM', f'{base}...{head}', cwd=root)
    added = set(git('diff', '--name-only', '--no-renames', '--diff-filter=A',
                    f'{base}...{head}', cwd=root).splitlines())
    tests, never_run = [], []
    for path in out.splitlines():
        if not os.path.isfile(os.path.join(root, path)):
            continue
        m = TEST_FILE.match(path)
        if m and (m.group(1) is None or m.group(1) in ci_packages):
            tests.append(path)
        elif path in added and (m or (TEST_DIR_DART.match(path) and MAIN.search(read(root, path)))):
            never_run.append(path)
    return sorted(tests), sorted(never_run)


class Runner:
    """Runs flutter test with coverage and adds up the line hits, with paths
    relative to the repo root."""

    def __init__(self, root, packages, tmp):
        self.root = root
        self.tmp = tmp
        self.pattern = '^(' + '|'.join(re.escape(n) for n in ['moonfin'] + sorted(packages.values())) + ')$'
        self.runs = 0
        self.with_coverage = 0

    def run(self, cwd, files):
        """Returns ({path: {line: hits}}, the JSON reporter's events), or
        (None, events) when the run wrote no coverage."""
        self.runs += 1
        lcov = os.path.join(self.tmp, f'{self.runs}.info')
        proc = subprocess.run(
            ['flutter', 'test', '--coverage', '--coverage-path', lcov,
             '--coverage-package', self.pattern, '--reporter', 'json', *files],
            cwd=cwd, capture_output=True, text=True)
        events = parse_events(proc.stdout)
        if not os.path.isfile(lcov):
            tail = '\n'.join((proc.stdout + proc.stderr).strip().splitlines()[-20:])
            print(f'warning: flutter test in {os.path.relpath(cwd, self.root)} exited '
                  f'{proc.returncode} and wrote no coverage:\n{tail}', file=sys.stderr)
            return None, events
        self.with_coverage += 1
        return read_lcov(lcov, cwd, self.root), events


def parse_events(stdout):
    events = []
    for line in stdout.splitlines():
        if line.startswith('{'):
            try:
                events.append(json.loads(line))
            except ValueError:
                pass
    return events


def results(events, cwd, root):
    """[(test name, result, test file relative to root)] for each test that
    ran, from flutter test's JSON reporter, plus result 'unfinished' for a
    test that started and never finished, which happens when the test process
    crashes. A file that fails to load reports as a test named "loading
    <path>" with an error. Hidden setUpAll and tearDownAll entries only count
    when they fail."""
    suites, tests, out = {}, {}, []
    for event in events:
        kind = event.get('type')
        if kind == 'suite':
            path = event['suite'].get('path') or ''
            rel = os.path.relpath(os.path.normpath(os.path.join(cwd, path)), root)
            suites[event['suite'].get('id')] = rel.replace(os.sep, '/')
        elif kind == 'testStart':
            test = event['test']
            tests[test.get('id')] = (test.get('name', ''), suites.get(test.get('suiteID'), ''))
        elif kind == 'testDone':
            name, suite = tests.pop(event.get('testID'), ('', ''))
            result = event.get('result')
            if (event.get('hidden') or event.get('skipped')) and result == 'success':
                continue
            out.append((name, result, suite))
    out.extend((name, 'unfinished', suite) for name, suite in tests.values())
    return out


def read_lcov(lcov, cwd, root):
    """An lcov file's line hits. Its SF: paths are relative to the directory
    flutter test ran in (lib/... from a package, ../server_core/lib/... for
    another package), so they're made relative to the repo root."""
    hits, source = {}, None
    with open(lcov) as f:
        for line in f:
            line = line.strip()
            if line.startswith('SF:'):
                rel = os.path.relpath(os.path.normpath(os.path.join(cwd, line[3:])), root)
                source = None if rel.startswith('..') else hits.setdefault(rel.replace(os.sep, '/'), {})
            elif line.startswith('DA:') and source is not None:
                fields = line[3:].split(',')
                if len(fields) >= 2 and fields[0].isdigit() and fields[1].lstrip('-').isdigit():
                    n = int(fields[0])
                    source[n] = source.get(n, 0) + int(fields[1])
    return hits


def merge(into, hits):
    for path, lines in (hits or {}).items():
        target = into.setdefault(path, {})
        for n, h in lines.items():
            target[n] = target.get(n, 0) + h


def own_tests_stage(root, runner, tests, lib_files, packages):
    """Stage 1: the branch's own test files, one flutter test per directory
    (the app's, or a package's), plus the imports test in the app's. Returns
    (hits, tests passed, tests failed, whether some run wrote no coverage);
    the imports test isn't counted."""
    groups = {}
    for path in tests:
        pkg = TEST_FILE.match(path).group(1)
        cwd = os.path.join(root, 'packages', pkg) if pkg else root
        groups.setdefault(cwd, []).append(os.path.relpath(os.path.join(root, path), cwd))
    hits, passed, failed, lost = {}, 0, 0, False
    imports_test = write_imports_test(root, lib_files, packages)
    try:
        if imports_test:
            groups.setdefault(root, []).append(imports_test)
        for cwd, files in sorted(groups.items()):
            h, events = runner.run(cwd, files)
            if h is None:
                lost = True
            merge(hits, h)
            for name, result, suite in results(events, cwd, root):
                # If the imports test fails to load, its files just stay unloaded.
                if suite.endswith(IMPORTS_TEST):
                    continue
                if result == 'success':
                    passed += 1
                else:
                    failed += 1
    finally:
        if imports_test:
            os.remove(os.path.join(root, imports_test))
    return hits, passed, failed, lost


def needs_own_process(text):
    return bool((OWN_BINDING.search(text) and not TEST_BINDING.search(text))
                or LIBRARY_ANNOTATION.search(text) or ASYNC_MAIN.search(text))


def write_bundle(root, path, files):
    with open(os.path.join(root, path), 'w') as f:
        f.write('// Generated by scripts/ci/changed_lines_coverage.py, delete if left behind.\n')
        f.write("import 'package:flutter_test/flutter_test.dart';\n")
        for i, test in enumerate(files):
            f.write(f"import '{os.path.relpath(test, 'test')}' as t{i};\n")
        f.write('\nvoid main() {\n')
        for i, test in enumerate(files):
            f.write(f"  group('{test}', t{i}.main);\n")
        f.write('}\n')


def suite_stage(root, runner, skip, lib_files, packages):
    """Stage 2: the rest of the app's suite, bundled, then on their own the
    files that failed or were lost in a bundle. The packages' suites run when
    the branch changes package code, since app code can't be reached from a
    package's tests. Returns (hits, files that still fail on their own,
    whether some coverage was lost)."""
    app_tests = sorted(
        os.path.relpath(p, root).replace(os.sep, '/')
        for p in glob.glob(os.path.join(root, 'test', '**', '*_test.dart'), recursive=True)
        if not os.path.basename(p).startswith(GENERATED_PREFIX))
    app_tests = [t for t in app_tests if t not in skip]
    solo = [t for t in app_tests if needs_own_process(read(root, t))]
    bundled = [t for t in app_tests if t not in solo]
    bundles = {}
    for k in range(BUNDLES):
        part = bundled[k::BUNDLES]
        if part:
            bundles[os.path.join('test', f'{GENERATED_PREFIX}bundle_{k}_test.dart')] = part

    hits, lost = {}, False
    try:
        for path, files in bundles.items():
            write_bundle(root, path, files)
        h, events = runner.run(root, [*bundles, *solo])
    finally:
        for path in bundles:
            os.remove(os.path.join(root, path))
    merge(hits, h)

    # A test process writes its coverage when it finishes, so a bundle that
    # crashed or didn't load lost all of it, and all its files run again. A
    # failing test in a bundle that finished only costs its own file's lines.
    # A solo file's failure is a real one, which the Checks run reports too.
    # A run that wrote no coverage at all is reported as partial rather than
    # run again file by file, which would take longer than the step allows.
    rerun, still_failing = set(), set()
    if h is None:
        lost = True
    for name, result, suite in results(events, root, root):
        if result == 'success':
            continue
        if suite not in bundles:
            still_failing.add(suite)
            continue
        first = name.split(' ', 1)[0]
        if result == 'unfinished' or name.startswith('loading ') or first not in bundles[suite]:
            rerun.update(bundles[suite])
        else:
            rerun.add(first)

    if rerun:
        h, events = runner.run(root, sorted(rerun))
        if h is None:
            lost = True
        merge(hits, h)
        still_failing.update(suite for _, result, suite in results(events, root, root)
                             if result != 'success')

    changed_packages = {m.group(1) for m in (re.match(r'^packages/([^/]+)/lib/', p) for p in lib_files) if m}
    if changed_packages:
        for pkg in workflow_packages(root):
            cwd = os.path.join(root, 'packages', pkg)
            if not os.path.isdir(os.path.join(cwd, 'test')):
                continue
            files = [os.path.relpath(p, cwd) for p in
                     sorted(glob.glob(os.path.join(cwd, 'test', '**', '*_test.dart'), recursive=True))
                     if f'packages/{pkg}/' + os.path.relpath(p, cwd).replace(os.sep, '/') not in skip]
            if not files:
                continue
            h, events = runner.run(cwd, files)
            if h is None:
                lost = True
            merge(hits, h)
            still_failing.update(suite for _, result, suite in results(events, cwd, root)
                                 if result != 'success')
    return hits, sorted(still_failing), lost


def not_run_ranges(executable, hits, hunks):
    """The changed lines no test ran, as (first, last) ranges. A range breaks
    at a changed line that did run and between two hunks of the diff, so
    comments and blank lines inside a hunk don't split it, and unchanged code
    between two hunks doesn't join them."""
    hunk_of = {n: i for i, (first, last) in enumerate(hunks) for n in range(first, last + 1)}
    ranges, start, last = [], None, None
    for n in executable:
        if start is not None and (hits.get(n, 0) > 0 or hunk_of.get(n) != hunk_of.get(last)):
            ranges.append((start, last))
            start = None
        if hits.get(n, 0) == 0:
            if start is None:
                start = n
            last = n
    if start is not None:
        ranges.append((start, last))
    return ranges


def line_map(path, ref, root):
    """Maps a line of the checked-out file to the same line in REF's copy, or
    None for a line the two copies don't share. CI checks out the merge of the
    pull request into its base, and Files changed shows the pull request's
    head, so a line moves when the base changed the file above it."""
    out = git('diff', '-U0', '--no-color', '--no-ext-diff', 'HEAD', ref, '--', path, cwd=root)
    hunks = [(int(m.group(1)), int(m.group(2) or 1), int(m.group(4) or 1))
             for m in re.finditer(r'^@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@', out, re.M)]

    def to_ref(n):
        shift = 0
        for start, old, new in hunks:
            if old == 0:
                # Lines inserted after line start: only later lines move.
                if n > start:
                    shift += new
            elif n >= start + old:
                shift += new - old
            elif n >= start:
                return None
        return n + shift
    return to_ref


def annotate(gaps_by_file, ref, root):
    """Prints a notice annotation for each of the biggest ranges of changed
    lines no test ran, so they show on those lines in Files changed. GitHub
    keeps 10 notices per step. A range whose lines the base also changed is
    left out rather than marked in the wrong place. Returns how many it
    printed."""
    ranges = sorted(((last - first + 1, path, first, last)
                     for path, gaps in gaps_by_file.items() for first, last in gaps),
                    key=lambda r: (-r[0], r[1], r[2]))
    maps, printed = {}, 0
    for _, path, first, last in ranges:
        if printed == MAX_ANNOTATIONS:
            break
        to_ref = maps.setdefault(path, line_map(path, ref, root))
        a, b = to_ref(first), to_ref(last)
        if a is None or b is None or b - a != last - first:
            continue
        # Workflow command properties escape these characters, the message
        # only the first three.
        prop = path.replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A') \
            .replace(':', '%3A').replace(',', '%2C')
        what = f'Line {a} changed in this pull request, and no test runs it.' if a == b else \
            f'Lines {a}-{b} changed in this pull request, and no test runs them.'
        print(f'::notice file={prop},line={a},endLine={b},title=Not run by any test::{what}')
        printed += 1
    return printed


def summarize(result, ranges, hits, own_hits):
    """Fills in the line counts and the per-file rows. Returns the ranges no
    test ran, by file, for annotate()."""
    files, gaps_by_file = [], {}
    result['lines'] = result['lines_run'] = 0
    result['own_run'] = 0 if own_hits is not None else None
    for path, rs in ranges.items():
        changed = sorted({n for first, last in rs for n in range(first, last + 1)})
        if path not in hits:
            files.append({'file': path, 'loaded': False, 'changed': len(changed),
                          'run': 0, 'own_run': 0, 'lines': 0, 'not_run': [], 'more_ranges': 0})
            continue
        executable = [n for n in changed if n in hits[path]]
        if not executable:
            continue
        run = sum(1 for n in executable if hits[path][n] > 0)
        own = sum(1 for n in executable if (own_hits or {}).get(path, {}).get(n, 0) > 0)
        gaps = gaps_by_file[path] = not_run_ranges(executable, hits[path], rs)
        files.append({'file': path, 'loaded': True, 'changed': len(changed),
                      'run': run, 'own_run': own, 'lines': len(executable),
                      'not_run': [list(g) for g in gaps[:MAX_RANGES]],
                      'more_ranges': max(0, len(gaps) - MAX_RANGES)})
        result['lines_run'] += run
        result['lines'] += len(executable)
        if own_hits is not None:
            result['own_run'] += own
    # Biggest part of the change first, so the top of the list is where most
    # of it is, however well it's tested. A file no test loaded counts its
    # changed lines, as it has no measurable ones.
    files.sort(key=lambda f: (-(f['lines'] if f['loaded'] else f['changed']), f['file']))
    result['files'] = files[:MAX_FILES]
    result['more_files'] = max(0, len(files) - MAX_FILES)
    result['unloaded'] = sum(1 for f in files if not f['loaded'])
    return gaps_by_file


def write(path, result):
    if path:
        with open(path, 'w') as f:
            json.dump(result, f, indent=2)


def main():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('base', help='base ref, e.g. upstream/main or origin/main')
    parser.add_argument('head', nargs='?', default='HEAD', help='head ref (default HEAD)')
    parser.add_argument('--out', help='write the JSON result to this file')
    parser.add_argument('--pr-number', type=int, help='stored in the result for the PR comment')
    parser.add_argument('--annotate', metavar='REF',
                        help="mark the biggest ranges of lines no test runs as GitHub annotations, "
                             "at their line numbers in REF (the pull request's head, which is "
                             "what Files changed shows)")
    args = parser.parse_args()

    root = repo_root()
    ranges = {p: r for p, r in changed_ranges(args.base, args.head, cwd=root, ignore_whitespace=True).items()
              if r and LIB_FILE.match(p) and not GENERATED.search(p) and os.path.isfile(os.path.join(root, p))}
    web_only = sorted(p for p in ranges if p.endswith('_web.dart') or WEB_ONLY.search(read(root, p)))
    for p in web_only:
        del ranges[p]
    tests, never_run = changed_test_files(args.base, args.head, root)
    packages = local_packages(root)

    result = {'status': 'ok', 'pr_number': args.pr_number, 'partial': None,
              'test_files': len(tests), 'own_tests': 'ran', 'tests_passed': 0, 'tests_failed': 0,
              'suite_ran': False, 'suite_failing': [],
              'lines_run': 0, 'own_run': None, 'lines': 0, 'files': [], 'more_files': 0, 'unloaded': 0,
              'web_only': web_only,
              # Why each added test file never runs in CI: its name, or its package.
              'never_run_tests': [{'file': p, 'reason': 'package' if TEST_FILE.match(p) else 'name'}
                                  for p in never_run]}
    if not ranges:
        result['status'] = 'no_code'
    else:
        lib_files = sorted(ranges)
        with tempfile.TemporaryDirectory() as tmp:
            runner = Runner(root, packages, tmp)
            own = tests if tests and len(tests) <= MAX_OWN_TEST_FILES else []
            result['own_tests'] = 'ran' if own else 'none' if not tests else 'too_many'
            own_hits, result['tests_passed'], result['tests_failed'], own_lost = own_tests_stage(
                root, runner, own, lib_files, packages)
            # Stage 1 can have nothing to run, when only part files changed
            # and no tests. That's no crash: they show as unloaded and stage
            # 2 measures them.
            if runner.runs and not runner.with_coverage:
                result.update(status='error', files=[], lines=0, lines_run=0)
                write(args.out, result)
                sys.exit('error: the test run wrote no coverage')
            hits = {}
            merge(hits, own_hits)
            summarize(result, ranges, hits, own_hits if own else None)

            # Any test can only add to what the branch's own tests ran, so
            # when they ran every changed line there's nothing to add, even if
            # one of their runs wrote no coverage.
            if result['lines_run'] < result['lines'] or result['unloaded']:
                result['partial'] = 'stopped'
                write(args.out, result)
                suite_hits, result['suite_failing'], lost = suite_stage(
                    root, runner, set(own), lib_files, packages)
                merge(hits, suite_hits)
                result['suite_ran'] = True
                # Stage 2 skips the branch's own tests, so coverage a stage 1
                # run lost stays lost.
                result['partial'] = 'lost' if lost or own_lost else None
            gaps_by_file = summarize(result, ranges, hits, own_hits if own else None)
            if args.annotate:
                result['annotated'] = annotate(gaps_by_file, args.annotate, root)

    write(args.out, result)

    print(f"{len(tests)} changed test files, {len(ranges)} changed lib files, status {result['status']}")
    if result['status'] == 'ok':
        own_note = (f", {result['own_run']} by the branch's own tests" if result['own_run'] is not None else '')
        print(f"Tests run {result['lines_run']} of {result['lines']} measurable changed lines{own_note}"
              f"{'' if result['suite_ran'] else ' (own tests ran them all, suite not needed)'}")
        for f in result['files']:
            if f['loaded']:
                gaps = ', '.join(f'{a}-{b}' if a != b else str(a) for a, b in f['not_run'])
                print(f"  {f['file']} {f['run']} of {f['lines']}" + (f', not run: {gaps}' if gaps else ''))
            else:
                print(f"  {f['file']} not loaded by any test ({f['changed']} changed lines)")
        for t in result['suite_failing']:
            print(f'  fails even on its own: {t}')
    for p in web_only:
        print(f'  web only, VM tests can\'t load it: {p}')
    for t in result['never_run_tests']:
        why = ("its package isn't in the Checks package list" if t['reason'] == 'package'
               else 'test files must end in _test.dart')
        print(f"  never runs in CI, {why}: {t['file']}")


if __name__ == '__main__':
    try:
        main()
    except subprocess.CalledProcessError as e:
        sys.exit(f"error: {' '.join(e.cmd)} failed: {(e.stderr or '').strip()}")
