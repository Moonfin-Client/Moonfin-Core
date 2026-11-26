#!/usr/bin/env python3
"""Fails when a translation uses a placeholder name the template doesn't have.

flutter gen-l10n accepts {datum} in a translation when the template only has
{date}, and the generated method gains a parameter no caller passes, so the
app stops compiling. Weblate flags these strings but still commits them,
because ARB files have no "needs editing" state. A translation that leaves
a placeholder out still builds, so that only gets a warning.
"""

import glob
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from l10n_guard import l10n_config  # noqa: E402
from touched_lines_diagnostics import repo_root  # noqa: E402

ARGUMENT = re.compile(r'\{\s*([A-Za-z_]\w*)\s*[,}]')


def arguments(message):
    """Argument names in an ICU message, including ones inside plural and
    select branches. A brace at even depth opens an argument and one at odd
    depth opens a branch. Apostrophes are read literally, like gen-l10n does
    while l10n.yaml leaves use-escaping off, so this needs ICU quoting if that
    ever gets turned on."""
    names, depth = set(), 0
    for i, ch in enumerate(message):
        if ch == '{':
            if depth % 2 == 0:
                m = ARGUMENT.match(message, i)
                if m:
                    names.add(m.group(1))
            depth += 1
        elif ch == '}':
            depth -= 1
    return names


def line_of(text, key):
    # Placeholder names like "name" also show up as keys inside @ metadata,
    # so only a key at the top level's indent counts.
    indent = re.search(r'^([ \t]*)"', text, re.M).group(1)
    m = re.search('^' + indent + '"' + re.escape(key) + r'"\s*:', text, re.M)
    return text.count('\n', 0, m.start()) + 1 if m else 1


def braces(names):
    return ', '.join('{' + n + '}' for n in names)


def main():
    assert arguments('Hi {name}') == {'name'}
    assert arguments('{n, plural, =1{One by {who}} other{{n} by {who}}}') == {'n', 'who'}
    assert arguments("Remove '{name}'?") == {'name'}

    root = repo_root()
    config = l10n_config(root)
    arb_dir = os.path.join(root, config['arb-dir'])
    template_name = config['template-arb-file']
    with open(os.path.join(arb_dir, template_name), encoding='utf-8') as f:
        template = json.load(f)

    used_in_template, allowed = {}, {}
    for key, value in template.items():
        if key.startswith('@') or not isinstance(value, str):
            continue
        declared = (template.get('@' + key) or {}).get('placeholders') or {}
        used_in_template[key] = arguments(value)
        allowed[key] = used_in_template[key] | set(declared)

    errors = 0
    for path in sorted(glob.glob(os.path.join(arb_dir, '*.arb'))):
        if os.path.basename(path) == template_name:
            continue
        with open(path, encoding='utf-8') as f:
            text = f.read()
        rel = os.path.relpath(path, root)
        for key, value in json.loads(text).items():
            if key not in allowed or not isinstance(value, str):
                continue
            used = arguments(value)
            unknown = sorted(used - allowed[key])
            missing = sorted(used_in_template[key] - used)
            if unknown:
                errors += 1
                print(f'::error file={rel},line={line_of(text, key)}::{key} uses '
                      f'{braces(unknown)}, which {template_name} doesn\'t have. '
                      f'gen-l10n adds it as a parameter and every caller stops compiling. '
                      f'Fix the string in Weblate.')
            elif missing:
                print(f'::warning file={rel},line={line_of(text, key)}::{key} leaves out '
                      f'{braces(missing)}, so this language shows less than English does.')

    return 1 if errors else 0


if __name__ == '__main__':
    sys.exit(main())
