

import 'package:dreamvila/core/utils/status.dart';
import 'package:equatable/equatable.dart';

class SignInState extends Equatable{
  final status signInStatus;
  final String errorMessage;
  final bool isPasswordVisible;

  const SignInState({ this.signInStatus = status.init,  this.errorMessage = '',this.isPasswordVisible = true});

  SignInState copyWith({status? signInStatus,String? errorMessage,bool? isPasswordVisible}){
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible
    );
}

  @override
  List<Object>get props => [signInStatus,errorMessage,isPasswordVisible];

}
