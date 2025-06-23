import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final status signInStatus;
  final String errorMessage;
  final bool isPasswordVisible;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const SignInState(
      {this.signInStatus = status.init,
      this.errorMessage = '',
      this.isPasswordVisible = true,
      required this.emailController,
      required this.passwordController,
      required this.formKey,
      });

  SignInState copyWith(
      {GlobalKey<FormState>? formKey,
      status? signInStatus,
      String? errorMessage,
      bool? isPasswordVisible,
      TextEditingController? emailController,
      TextEditingController? passwordController}) {
    return SignInState(
        formKey: formKey ?? this.formKey,
        signInStatus: signInStatus ?? this.signInStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController);
  }

  @override
  List<Object?> get props => [
        formKey,
        signInStatus,
        errorMessage,
        isPasswordVisible,
        emailController,
        passwordController
      ];
}
