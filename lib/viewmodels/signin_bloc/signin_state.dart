

import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:equatable/equatable.dart';

class SignInState extends Equatable{
  final status signInStatus;
  final String errorMessage;
  final bool isPasswordVisible;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const SignInState({ this.signInStatus = status.init,  this.errorMessage = '',this.isPasswordVisible = true,this.emailController,this.passwordController});

  SignInState copyWith({status? signInStatus,String? errorMessage,bool? isPasswordVisible,TextEditingController? emailController,TextEditingController? passwordController}){
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController
    );
}

  @override
  List<Object?>get props => [signInStatus,errorMessage,isPasswordVisible,emailController,passwordController];

}
