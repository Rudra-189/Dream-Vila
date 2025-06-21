import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/l10n.dart';
extension AppLocalizationsX on BuildContext {
  Lang? get l10n => Lang.of(this);
}

// Add all localization delegates here
final List<LocalizationsDelegate<dynamic>> localizationDelegates = [
  Lang.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];