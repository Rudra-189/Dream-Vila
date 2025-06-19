
import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class TogglePasswordVisibilityEvent extends SignInEvent {}

class OnLoginButtonEvent extends SignInEvent{
  final String email;
  final String password;

  OnLoginButtonEvent(this.email, this.password);

  @override
  List<Object>get props => [email,password];
}