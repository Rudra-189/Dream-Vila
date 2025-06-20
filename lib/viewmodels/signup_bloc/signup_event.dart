import 'package:dio/dio.dart';
import 'package:dreamvila/models/signUpModel.dart';
import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable{
  @override
  List<Object>get props =>[];
}

class TogglePasswordVisibilityEvent extends SignupEvent {}

class ToggleConfirmPasswordVisibilityEvent extends SignupEvent {}

class ImagePickedEvent extends SignupEvent {}

class SignupSubmittedEvent extends SignupEvent {
  final SignupModel formData;

  SignupSubmittedEvent(this.formData);

  @override
  List<Object> get props => [formData];
}

class OnHobbyChangeEvent extends SignupEvent{
  final String hobby;
  OnHobbyChangeEvent(this.hobby);

  @override
  List<Object> get props => [hobby];
}

class OnGenderChangeEvent extends SignupEvent{
  final String gender;
  OnGenderChangeEvent(this.gender);

  @override
  List<Object> get props => [gender];
}


