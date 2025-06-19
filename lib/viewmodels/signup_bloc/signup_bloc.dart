import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utils/ImagePickerUtils.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {

  final ImagePickerUtils imagePickerUtils;


  SignupBloc(this.imagePickerUtils)
      : super(SignupState()) {
    on<TogglePasswordVisibilityEvent>(_togglePasswordVisibilityEvent);
    on<ToggleConfirmPasswordVisibilityEvent>(_toggleConfirmPasswordVisibilityEvent);
    on<ImagePickedEvent>(_imagePickedEvent);
    on<SignupSubmittedEvent>(_signupSubmittedEvent);
    on<OnHobbyChangeEvent>(_onHobbyChangeEvent);
    on<OnGenderChangeEvent>(_onGenderChangeEvent);
  }
  void _togglePasswordVisibilityEvent(
      TogglePasswordVisibilityEvent event, Emitter emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _toggleConfirmPasswordVisibilityEvent(
      ToggleConfirmPasswordVisibilityEvent event, Emitter emit) {
    emit(state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible));
  }

  void _imagePickedEvent(ImagePickedEvent event, Emitter emit) async{
    XFile? file = await imagePickerUtils.PickImageFromGallary();
    emit(state.copyWith(file: file));
  }

  void _signupSubmittedEvent(SignupSubmittedEvent event, Emitter emit) {
    print("Signup Submitted: ${event.formData}");
  }

  void _onHobbyChangeEvent(OnHobbyChangeEvent event, Emitter emit) {
    List<String> currentHobbies = List<String>.from(state.selectedHobbies);

    if (currentHobbies.contains(event.hobby)) {
      print(event.hobby);
      currentHobbies.remove(event.hobby);
    } else {
      currentHobbies.add(event.hobby);
      print(event.hobby);
    }
    emit(state.copyWith(selectedHobbies: currentHobbies));
  }

  void _onGenderChangeEvent(OnGenderChangeEvent event, Emitter emit) {
    emit(state.copyWith(gender: event.gender));
  }
}
