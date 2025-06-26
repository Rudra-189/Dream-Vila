import 'package:dreamvila/models/auth_model/signUpModel.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
  @override
  List<Object>get props => [];
}

//signInEvents
class TogglePasswordVisibilityEvent extends AuthEvent {}

class OnLoginButtonEvent extends AuthEvent{
  final String email;
  final String password;

  OnLoginButtonEvent(this.email, this.password);

  @override
  List<Object>get props => [email,password];
}


//signUpEvents
class ToggleSPasswordVisibilityEvent extends AuthEvent {}

class ToggleConfirmPasswordVisibilityEvent extends AuthEvent {}

class ImagePickedEvent extends AuthEvent {}

class SignupSubmittedEvent extends AuthEvent {
  final SignupModel formData;

  SignupSubmittedEvent(this.formData);

  @override
  List<Object> get props => [formData];
}

class OnHobbyChangeEvent extends AuthEvent{
  final String hobby;
  OnHobbyChangeEvent(this.hobby);

  @override
  List<Object> get props => [hobby];
}

class OnGenderChangeEvent extends AuthEvent{
  final String gender;
  OnGenderChangeEvent(this.gender);

  @override
  List<Object> get props => [gender];
}