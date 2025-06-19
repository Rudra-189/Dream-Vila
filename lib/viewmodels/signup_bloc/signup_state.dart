// lib/blocs/signup/signup_state.dart
import 'dart:io';
import 'package:dreamvila/core/utils/status.dart';
import 'package:equatable/equatable.dart';
class SignupState extends Equatable {

  final status signUpStatus;
  final String errorMessage;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final File? file;
  final String gender;
  final List<String> selectedHobbies;

    SignupState({
      this.signUpStatus = status.init,
      this.errorMessage = '',
    this.isPasswordVisible = true,
    this.isConfirmPasswordVisible = true,
    this.file,
    this.gender = 'Male',
    this.selectedHobbies = const [],
  });


  SignupState copyWith({
    status? signUpStatus,
    String? errorMessage,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    File? file,
    String? gender,
    List<String>? selectedHobbies,
  }) {
    return SignupState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      file: file ?? this.file,
      gender: gender ?? this.gender,
      selectedHobbies: selectedHobbies ?? this.selectedHobbies
    );
  }

  @override
  List<Object?> get props => [signUpStatus,errorMessage,isPasswordVisible, isConfirmPasswordVisible, file,gender,selectedHobbies];
}
