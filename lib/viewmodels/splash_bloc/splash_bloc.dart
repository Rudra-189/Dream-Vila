import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/utils/shared_preferences.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_event.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  SplashBloc() : super(SplashState()) {
    on<LoadSplashEvent>(_loadSplashEvent);
  }
  Future<void> _loadSplashEvent(LoadSplashEvent event, Emitter emit) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(splashstatus: Status.loading));
    bool result = await sharedPreferencesService.getUserIsLogin();
    await Future.delayed(Duration(seconds: 3));
    if (result) {
      emit(state.copyWith(splashstatus: Status.success));
    } else {
      emit(state.copyWith(splashstatus: Status.failure));
    }
  }
}
