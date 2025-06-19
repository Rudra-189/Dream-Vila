// lib/blocs/signup/signup_state.dart
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class SignupState extends Equatable {

  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final XFile? file;
  final String gender;
  final List<String> selectedHobbies;

    SignupState({
    this.isPasswordVisible = true,
    this.isConfirmPasswordVisible = true,
    this.file,
    this.gender = 'Male',
    this.selectedHobbies = const [],
  });


  SignupState copyWith({
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    XFile? file,
    String? gender,
    List<String>? selectedHobbies,
  }) {
    return SignupState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      file: file ?? this.file,
      gender: gender ?? this.gender,
      selectedHobbies: selectedHobbies ?? this.selectedHobbies
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible, isConfirmPasswordVisible, file,gender,selectedHobbies];
}
