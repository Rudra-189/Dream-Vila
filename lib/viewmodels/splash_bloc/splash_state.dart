import 'package:dreamvila/core/utils/status.dart';
import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final status splashStatus;
  final String errorMessage;

  const SplashState({this.splashStatus = status.init, this.errorMessage = ''});

  SplashState copyWith({status? splashStatus, String? errorMessage}){
    return SplashState(
        splashStatus: splashStatus ?? this.splashStatus,
        errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [splashStatus,errorMessage];
}
