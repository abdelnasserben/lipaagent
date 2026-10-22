import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';

export 'generated/app_localizations.dart';

/// Every user-visible text: `l10n.someKey` (like `t('key')` in the
/// back-office). The texts are in lib/l10n/app_fr.arb.
///
/// The app is in French only for now; [useLocale] switches the language once
/// other ARB files exist.
AppLocalizations get l10n => _l10n;

AppLocalizations _l10n = lookupAppLocalizations(appLocale);

/// The language of the app.
const appLocale = Locale('fr');

void useLocale(Locale locale) => _l10n = lookupAppLocalizations(locale);
