#!/usr/bin/env python3
"""Derive the internal Portuguese alias; never modify pt-BR."""
import json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
data=json.loads((root/'lib/l10n/app_pt_PT.arb').read_text(encoding='utf-8'))
data['@@locale']='pt'
(root/'lib/l10n/app_pt.arb').write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
