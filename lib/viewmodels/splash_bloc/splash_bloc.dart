import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_event.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<LoadSplashEvent>(_loadSplashEvent);
  }
  Future<void>_loadSplashEvent(LoadSplashEvent event,Emitter emit)async{
    emit(state.copyWith(splashStatus: status.loading));
    await Future.delayed(Duration(seconds: 3));
    emit(state.copyWith(splashStatus: status.success));
  }
}
