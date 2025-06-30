import 'package:dreamvila/core/utils/status.dart';
import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final Status splashstatus;
  final String errorMessage;

  const SplashState({this.splashstatus = Status.init, this.errorMessage = ''});

  SplashState copyWith({Status? splashstatus, String? errorMessage}) {
    return SplashState(
      splashstatus: splashstatus ?? this.splashstatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [splashstatus, errorMessage];
}
