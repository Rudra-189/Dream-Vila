import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../core/utils/status.dart';

class LanguageState extends Equatable{
  final Locale? locale;
  final String errorMessage;
  final status languageStatus;

  const LanguageState({this.locale,this.errorMessage = '',this.languageStatus = status.init});

  LanguageState copyWith({Locale? locale,String? errorMessage,status? languageStatus}){
    return LanguageState(
      locale: locale ?? this.locale,
      errorMessage: errorMessage ?? this.errorMessage,
      languageStatus: languageStatus ?? this.languageStatus
    );
  }

  @override
  List<Object?> get props => [locale,errorMessage,languageStatus];
}
