import 'dart:ui';

import 'package:dreamvila/core/utils/status.dart';
import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  final Locale? locale;
  final String errorMessage;
  final Status languagestatus;

  const LanguageState(
      {this.locale, this.errorMessage = '', this.languagestatus = Status.init});

  LanguageState copyWith(
      {Locale? locale, String? errorMessage, Status? languagestatus}) {
    return LanguageState(
        locale: locale ?? this.locale,
        errorMessage: errorMessage ?? this.errorMessage,
        languagestatus: languagestatus ?? this.languagestatus);
  }

  @override
  List<Object?> get props => [locale, errorMessage, languagestatus];
}
