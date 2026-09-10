#!/usr/bin/env python3
"""Re-adds the tvos plugins to .flutter-plugins-dependencies.

Running the regular flutter tool (pub get, analyze, build) regenerates that
file without a tvos key, and the next pod install then drops every *_tvos pod
from the tvOS Runner. Run this before pod install / xcodebuild in tvos/.
"""
import json
import os
import sys
from urllib.parse import unquote, urlparse

repo_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
registry = os.path.join(repo_root, '.flutter-plugins-dependencies')
resolved = os.path.join(repo_root, '.dart_tool', 'package_config.json')

if not os.path.isfile(resolved):
    sys.exit(f'error: {resolved} not found. Run flutter-tvos pub get first.')

# Read where pub actually put each package rather than naming versions here,
# which went stale every time one of them moved.
with open(resolved) as f:
    packages = json.load(f)['packages']

entries = []
for package in sorted(packages, key=lambda p: p['name']):
    if not package['name'].endswith('_tvos'):
        continue
    path = unquote(urlparse(package['rootUri']).path)
    if not os.path.isdir(path):
        sys.exit(f'error: {path} not found. Run flutter-tvos pub get first.')
    entries.append({
        'name': package['name'],
        'path': path + os.sep,
        'native_build': True,
        'shared_darwin_source': False,
        'dependencies': [],
        'dev_dependency': False,
    })

if not entries:
    sys.exit('error: no *_tvos packages resolved. Run flutter-tvos pub get first.')

with open(registry) as f:
    data = json.load(f)
data['plugins']['tvos'] = entries
with open(registry, 'w') as f:
    json.dump(data, f, indent=2)
print('restored tvos plugins:', ', '.join(e['name'] for e in entries))
