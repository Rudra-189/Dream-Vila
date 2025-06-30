import 'dart:io';

import 'package:dreamvila/core/utils/exports.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final Status signInstatus;
  final Status signUpstatus;

  final String errorMessage;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  final File? file;
  final String gender;
  final List<String> selectedHobbies;

  final TextEditingController signInEmailController;
  final TextEditingController signInPasswordController;

  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController confirmPasswordController;

  final GlobalKey<FormState> signUpFromKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFromKey = GlobalKey<FormState>();

  AuthState({
    this.signInstatus = Status.init,
    this.errorMessage = '',
    this.isPasswordVisible = true,
    required this.signInEmailController,
    required this.signInPasswordController,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.mobileController,
    required this.confirmPasswordController,
    this.signUpstatus = Status.init,
    this.isConfirmPasswordVisible = true,
    this.file,
    this.gender = 'Male',
    this.selectedHobbies = const [],
    GlobalKey<FormState>? signUpFromKey,
    GlobalKey<FormState>? signInFromKey,
  });

  factory AuthState.initial() {
    return AuthState(
      signInEmailController: TextEditingController(),
      signInPasswordController: TextEditingController(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      mobileController: TextEditingController(),
      firstNameController: TextEditingController(),
      lastNameController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
    );
  }

  AuthState copyWith({
    Status? signInstatus,
    Status? signUpstatus,
    String? errorMessage,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    File? file,
    String? gender,
    List<String>? selectedHobbies,
    TextEditingController? signInEmailController,
    TextEditingController? signInPasswordController,
    TextEditingController? passwordController,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    TextEditingController? mobileController,
    TextEditingController? confirmPasswordController,
    GlobalKey<FormState>? signUpFromKey,
    GlobalKey<FormState>? signInFromKey,
  }) {
    return AuthState(
        signInstatus: signInstatus ?? this.signInstatus,
        signUpstatus: signUpstatus ?? this.signUpstatus,
        errorMessage: errorMessage ?? this.errorMessage,
        signInPasswordController:
            signInPasswordController ?? this.signInPasswordController,
        signInEmailController:
            signInEmailController ?? this.signInEmailController,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        isConfirmPasswordVisible:
            isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
        file: file ?? this.file,
        gender: gender ?? this.gender,
        selectedHobbies: selectedHobbies ?? this.selectedHobbies,
        passwordController: passwordController ?? this.passwordController,
        firstNameController: firstNameController ?? this.firstNameController,
        lastNameController: lastNameController ?? this.lastNameController,
        emailController: emailController ?? this.emailController,
        confirmPasswordController:
            confirmPasswordController ?? this.confirmPasswordController,
        mobileController: mobileController ?? this.mobileController,
        signUpFromKey: signUpFromKey,
        signInFromKey: signUpFromKey);
  }

  @override
  List<Object?> get props => [
        signInstatus,
        signInstatus,
        errorMessage,
        isPasswordVisible,
        isConfirmPasswordVisible,
        file,
        gender,
        selectedHobbies,
        signInEmailController,
        signInPasswordController,
        passwordController,
        confirmPasswordController,
        firstNameController,
        lastNameController,
        mobileController,
        emailController,
        signInFromKey,
        signUpFromKey
      ];
}
