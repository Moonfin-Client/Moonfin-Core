#!/usr/bin/env python3
"""Apply Moonfin Books branding to a completed Flutter web bundle."""
from pathlib import Path
import hashlib
import json
import re
import sys

root = Path(sys.argv[1] if len(sys.argv) > 1 else "build/web")
revision = hashlib.sha256((root / "main.dart.js").read_bytes()).hexdigest()[:12]
cache_key = "books-" + revision
p = root / "manifest.json"
manifest = json.loads(p.read_text())
manifest.update(name="Moonfin Books", short_name="Moonfin Books", description="Media, books and audiobook requests in one client")
p.write_text(json.dumps(manifest, indent=2) + "\n")
p = root / "index.html"
html = p.read_text().replace("<title>Moonfin</title>", "<title>Moonfin Books</title>")
html = html.replace('name="apple-mobile-web-app-title" content="Moonfin"', 'name="apple-mobile-web-app-title" content="Moonfin Books"')
html = re.sub(r'src="flutter_bootstrap\.js[^"\s]*"', f'src="flutter_bootstrap.js?v={cache_key}"', html)
p.write_text(html)
p = root / "flutter_bootstrap.js"
script = p.read_text()
match = re.search(r'_flutter.buildConfig\s*=\s*(\{.*?\});', script, re.S)
assert match, "Flutter buildConfig missing"
config = json.loads(match.group(1))
js_builds = [b for b in config["builds"] if b.get("compileTarget") == "dart2js"]
assert len(js_builds) == 1, "Build a JavaScript Flutter web bundle first"
js_builds[0]["mainJsPath"] = "main.dart.js?v=" + cache_key
config["builds"] = js_builds
script = script[:match.start(1)] + json.dumps(config, separators=(",", ":")) + script[match.end(1):]
start = script.rfind("_flutter.loader.load(")
assert start >= 0
p.write_text(script[:start] + "_flutter.loader.load({});\n")
print("Moonfin Books web bundle:", revision)
