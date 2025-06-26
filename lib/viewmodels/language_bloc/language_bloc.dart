
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/utils/status.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {

  final storage = FlutterSecureStorage();

  LanguageBloc() : super(LanguageState()) {
    on<LoadLanguageEvent>(_loadLanguageEvent);
    on<ChangeLanguageEvent>(_changeLanguageEvent);
  }
  Future<void>_loadLanguageEvent(LoadLanguageEvent event,Emitter emit)async{
    try{
      emit(state.copyWith(languageStatus: status.loading));

      final languageCode = await storage.read(key: "languageCode") ?? 'en';

      emit(state.copyWith(languageStatus: status.success,locale: Locale(languageCode)));
    }catch(e){
      emit(state.copyWith(languageStatus: status.failure,errorMessage: e.toString()));
    }
  }
  Future<void>_changeLanguageEvent(ChangeLanguageEvent event,Emitter emit)async{
   try{
     emit(state.copyWith(languageStatus: status.loading));

     await storage.write(key: 'languageCode', value: event.code);

     emit(state.copyWith(languageStatus: status.success,locale: Locale(event.code)));
   }catch(e){
     emit(state.copyWith(languageStatus: status.failure,errorMessage: e.toString()));
   }
  }
}
