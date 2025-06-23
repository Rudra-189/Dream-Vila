import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/repository/authRepository.dart';
import 'package:dreamvila/viewmodels/signin_bloc/signin_event.dart';
import 'package:dreamvila/viewmodels/signin_bloc/signin_state.dart';
import '../../core/api_config/client/api_client.dart';



class SignInBloc extends Bloc<SignInEvent, SignInState> {

  final AuthRepository authRepository = AuthRepository(ApiClient());


  SignInBloc() : super(SignInState(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
      formKey: GlobalKey<FormState>()
  )) {
    on<TogglePasswordVisibilityEvent>(_togglePasswordVisibilityEvent);
    on<OnLoginButtonEvent>(_onLoginButtonEvent);
  }
  void _togglePasswordVisibilityEvent(TogglePasswordVisibilityEvent event,Emitter emit){
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onLoginButtonEvent(OnLoginButtonEvent event,Emitter emit)async{
    emit(state.copyWith(signInStatus: status.loading));
    Map<String,dynamic> data = {
      "email": event.email,
      "password":event.password
    };

    final result = await authRepository.userLogin(data);
    print(result);
    if(result){
      emit(state.copyWith(signInStatus: status.success));
    }else{
      emit(state.copyWith(signInStatus: status.failure,errorMessage: 'some things was wrong!'));
    }

  }
}
