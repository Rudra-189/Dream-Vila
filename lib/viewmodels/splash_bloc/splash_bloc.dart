import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/utils/sharedPreferences.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_event.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final SharedPreferencesService sharedPreferencesService = SharedPreferencesService();

  SplashBloc() : super(SplashState()) {
    on<LoadSplashEvent>(_loadSplashEvent);
  }
  Future<void>_loadSplashEvent(LoadSplashEvent event,Emitter emit)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(splashStatus: status.loading));
    bool result = await sharedPreferencesService.getUserIsLogin();
    await Future.delayed(Duration(seconds: 3));
    print(result);
    if(result){
      emit(state.copyWith(splashStatus: status.success));
    }else{
      emit(state.copyWith(splashStatus: status.failure));
    }

  }
}
