import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_event.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {



  SplashBloc() : super(SplashState()) {
    on<LoadSplashEvent>(_loadSplashEvent);
  }
  Future<void>_loadSplashEvent(LoadSplashEvent event,Emitter emit)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(splashStatus: status.loading));
    bool result = prefs.getBool("isLogin") ?? false;
    print(result);
    if(result){
      emit(state.copyWith(splashStatus: status.success));
    }else{
      emit(state.copyWith(splashStatus: status.failure));
    }

  }
}
