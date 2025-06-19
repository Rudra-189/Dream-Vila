import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadLanguageEvent extends LanguageEvent{}

class ChangeLanguageEvent extends LanguageEvent{
  final String code;

  ChangeLanguageEvent({required this.code});

  @override
  List<Object> get props => [code];
}
