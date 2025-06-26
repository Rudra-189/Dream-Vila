import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/routes/app_routes.dart';
import 'package:dreamvila/core/utils/ImagePickerUtils.dart';
import 'package:dreamvila/core/utils/navigator_service.dart';
import 'package:dreamvila/core/utils/sharedPreferences.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/repository/auth_repository.dart';
import 'package:dreamvila/widgets/common_widget/app_toast_message.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthRepository authRepository = AuthRepository(ApiClient());

  final SharedPreferencesService sharedPreferencesService = SharedPreferencesService();

  final ImagePickerUtils imagePickerUtils = ImagePickerUtils();

  AuthBloc() : super(AuthState.initial()) {
    //signIn
    on<TogglePasswordVisibilityEvent>(_togglePasswordVisibilityEvent);
    on<OnLoginButtonEvent>(_onLoginButtonEvent);

    //SignUp
    on<ToggleConfirmPasswordVisibilityEvent>(_toggleConfirmPasswordVisibilityEvent);
    on<ImagePickedEvent>(_imagePickedEvent);
    on<SignupSubmittedEvent>(_signupSubmittedEvent);
    on<OnHobbyChangeEvent>(_onHobbyChangeEvent);
    on<OnGenderChangeEvent>(_onGenderChangeEvent);
  }

  //signIn
  void _togglePasswordVisibilityEvent(TogglePasswordVisibilityEvent event,Emitter emit){
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onLoginButtonEvent(OnLoginButtonEvent event,Emitter emit)async{
    emit(state.copyWith(signInStatus: status.loading));
    Map<String,dynamic> data = {
      "email": event.email,
      "password":event.password
    };

    final storage = FlutterSecureStorage();

    final result = await authRepository.userLogin(data);
    if(result.status == true){
      await storage.write(key: "deviceToken", value: result.token);
      sharedPreferencesService.storeUserIsLogin(true);
      emit(state.copyWith(signInStatus: status.success));
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
    }else{

      AppToast.show(message: result.message,type: ToastificationType.error);
      emit(state.copyWith(signInStatus: status.failure));
    }
  }

  //SignUp
  void _toggleConfirmPasswordVisibilityEvent(
      ToggleConfirmPasswordVisibilityEvent event, Emitter emit) {
    emit(state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible));
  }

  void _imagePickedEvent(ImagePickedEvent event, Emitter emit) async{
    XFile? file = await imagePickerUtils.PickImageFromGallary();
    emit(state.copyWith(file: File(file!.path)));
  }

  void _signupSubmittedEvent(SignupSubmittedEvent event, Emitter emit)async{
    emit(state.copyWith(signUpStatus: status.loading));

    Map<String,dynamic> data = {
      'image': [event.formData.image!.path],
      'firstName': event.formData.firstName,
      'lastName': event.formData.lastName,
      'gender': event.formData.gender.toString(),
      'hobby': event.formData.hobbies,
      'email': event.formData.email,
      'mobile': event.formData.mobile.toString(),
      'password': event.formData.password
    };

    final result = await authRepository.userSignup(data);
    if(result.status == true){
      emit(state.copyWith(signUpStatus: status.success));
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.signInScreen);
    }else{
      AppToast.show(message: result.message,type: ToastificationType.error);
      emit(state.copyWith(signUpStatus: status.failure));
    }
  }

  void _onHobbyChangeEvent(OnHobbyChangeEvent event, Emitter emit) {
    List<String> currentHobbies = List<String>.from(state.selectedHobbies);
    if (currentHobbies.contains(event.hobby)) {
      currentHobbies.remove(event.hobby);
    } else {
      currentHobbies.add(event.hobby);
    }
    emit(state.copyWith(selectedHobbies: currentHobbies));
  }

  void _onGenderChangeEvent(OnGenderChangeEvent event, Emitter emit) {
    emit(state.copyWith(gender: event.gender));
  }

}
