import 'dart:io';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:equatable/equatable.dart';
class SignupState extends Equatable {

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKeySignUp;

  final status signUpStatus;
  final String errorMessage;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final File? file;
  final String gender;
  final List<String> selectedHobbies;

    SignupState({
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.mobileController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.formKeySignUp,
      this.signUpStatus = status.init,
      this.errorMessage = '',
    this.isPasswordVisible = true,
    this.isConfirmPasswordVisible = true,
    this.file,
    this.gender = 'Male',
    this.selectedHobbies = const [],
  });


  SignupState copyWith({
    GlobalKey<FormState>? formKeySignUp,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    TextEditingController? mobileController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    status? signUpStatus,
    String? errorMessage,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    File? file,
    String? gender,
    List<String>? selectedHobbies,
  }) {
    return SignupState(
        formKeySignUp: formKeySignUp ?? this.formKeySignUp,
      firstNameController: firstNameController?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      emailController: emailController ?? this.emailController,
      mobileController: mobileController ?? this.mobileController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController,
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
  List<Object?> get props => [formKeySignUp,firstNameController,lastNameController,emailController,mobileController,passwordController,confirmPasswordController,signUpStatus,errorMessage,isPasswordVisible, isConfirmPasswordVisible, file,gender,selectedHobbies];
}
