import 'dart:ui';
import 'package:dreamvila/core/utils/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final storage = FlutterSecureStorage();

  LanguageBloc() : super(LanguageState()) {
    on<LoadLanguageEvent>(_loadLanguageEvent);
    on<ChangeLanguageEvent>(_changeLanguageEvent);
  }
  Future<void> _loadLanguageEvent(LoadLanguageEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(languagestatus: Status.loading));

      final languageCode = await storage.read(key: "languageCode") ?? 'gu';

      emit(state.copyWith(
          languagestatus: Status.success, locale: Locale(languageCode)));
    } catch (e) {
      emit(state.copyWith(
          languagestatus: Status.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _changeLanguageEvent(
      ChangeLanguageEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(languagestatus: Status.loading));

      await storage.write(key: 'languageCode', value: event.code);

      emit(state.copyWith(
          languagestatus: Status.success, locale: Locale(event.code)));
    } catch (e) {
      emit(state.copyWith(
          languagestatus: Status.failure, errorMessage: e.toString()));
    }
  }
}
