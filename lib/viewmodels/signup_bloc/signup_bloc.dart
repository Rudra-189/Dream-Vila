import 'dart:io';
import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/utils/ImagePickerUtils.dart';
import 'package:dreamvila/repository/authRepository.dart';
import 'package:dreamvila/viewmodels/signup_bloc/signup_event.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/exports.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {

  final ImagePickerUtils imagePickerUtils;

  final AuthRepository authRepository = AuthRepository(ApiClient());
  
  SignupBloc(this.imagePickerUtils)
      : super(SignupState(
    firstNameController:TextEditingController(),
    lastNameController: TextEditingController(),
    emailController: TextEditingController(),
    mobileController: TextEditingController(),
    passwordController: TextEditingController(),
    confirmPasswordController: TextEditingController(),
    formKeySignUp: GlobalKey<FormState>(),
  )) {
    on<ToggleSPasswordVisibilityEvent>(_togglePasswordVisibilityEvent);
    on<ToggleConfirmPasswordVisibilityEvent>(_toggleConfirmPasswordVisibilityEvent);
    on<ImagePickedEvent>(_imagePickedEvent);
    on<SignupSubmittedEvent>(_signupSubmittedEvent);
    on<OnHobbyChangeEvent>(_onHobbyChangeEvent);
    on<OnGenderChangeEvent>(_onGenderChangeEvent);
  }
  void _togglePasswordVisibilityEvent(
      ToggleSPasswordVisibilityEvent event, Emitter emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

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
    print("Signup Submitted: ${event.formData}");
    emit(state.copyWith(signUpStatus: status.loading));
    final result = await authRepository.userSignup(event.formData);
    if(result){
      emit(state.copyWith(signUpStatus: status.success));
    }else{
      emit(state.copyWith(signUpStatus: status.failure,errorMessage: 'some things was wrong!'));
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
