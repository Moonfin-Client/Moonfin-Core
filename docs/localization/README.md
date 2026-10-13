# Portuguese interface locales

Maintain European Portuguese in `lib/l10n/app_pt_PT.arb` and Brazilian Portuguese
in `lib/l10n/app_pt_BR.arb`. The generic `pt` resource is a compatibility alias
derived from European Portuguese, not a third translation to maintain.

After importing translations from Weblate, run:

```sh
python3 scripts/sync_portuguese_locale.py
flutter gen-l10n
```

The translation workflow derives the alias before generating localizations. The
script does not modify Brazilian Portuguese. Existing Brazilian translations and
English fallbacks are explicit in the Brazilian catalogue, so replacing the base
`pt` resource does not introduce European Portuguese into the Brazilian UI.

Interface preferences normalize `pt` and `pt_PT` to `pt-PT`, and `pt_BR` to `pt-BR`.
This applies to saved account scopes and device-language resolution. Audio and
subtitle-language preferences remain separate from interface-language resolution.

## Translator follow-up

The English library and author messages now use separate keys:
`noBooksFound` and `noBooksFoundForAuthor`. Other locales preserve their previous
author-context wording in the new key to avoid falling back to English. Review
both contexts in Weblate; `author-message-review.tsv` records the preserved text.

The 38 newly extracted UI messages are available for translation in other locales.
They retain the previous English UI wording until translated. Source changes that
correct behavior, especially `preferDefaultAudioTrackDescription`, also require
semantic review in other languages.

Import the English source and translated catalogues together when integrating
this change with Weblate, including the new author key and the derived `pt` policy.
