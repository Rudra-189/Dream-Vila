import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/viewmodels/signup_bloc/signup_event.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context,state){
          if(state.signUpStatus == status.success){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.signInScreen,(Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildCommonAuthDesign(label: "Sign Up",),
                    _buildCommonInput(state),
                    _buildGenderInput(context,state),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildImageInput(context,state),
                    SizedBox(
                      height: 30.h,
                    ),
                    _buildPasswordInput(context,state),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildHobbyInput(context,state),
                    SizedBox(
                      height: 20.h,
                    ),
                    CommonAuthFooter(
                      buttonText: "Sign Up",
                      footerText: "Already have an account? ",
                      onActionTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.signInScreen);
                      },
                      onButtonTap: () {
                        _submit(context, state);
                      },
                      isLoading: state.signUpStatus == status.loading,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _submit(BuildContext context, SignupState state) async {
    if (_formKey.currentState!.validate()) {
      final user = SignupModel(
        firstName: state.firstNameController!.text,
        lastName: state.lastNameController!.text,
        email: state.emailController!.text,
        mobile: state.mobileController!.text,
        gender: state.gender == 'Male' ? 1 : 2,
        hobbies: state.selectedHobbies.join(","),
        image: state.file,
        password: state.passwordController!.text,
      );
      context.read<SignupBloc>().add(SignupSubmittedEvent(user));
    }
  }
}

Widget _buildCommonInput(SignupState state){
  return Column(
    children: [
      LabeledTextField(label: 'First Name', controller: state.firstNameController!, inputType: InputType.text,validator: (value) => Validation.validateName(value!),),
      LabeledTextField(label: 'Last Name', controller: state.lastNameController!, inputType: InputType.text,validator: (value) => Validation.validateName(value!),),
      LabeledTextField(label: 'Email', controller: state.emailController!, inputType: InputType.text,validator: (value) => Validation.validateEmail(value!),),
      LabeledTextField(label: 'Mobile', controller: state.mobileController!, inputType: InputType.phoneNumber,validator: (value) => Validation.validateMobile(value!),),
    ],
  );
}

Widget _buildPasswordInput(BuildContext context,SignupState state){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Password", style: Theme.of(context).textTheme.bodyLarge),
      SizedBox(
        height: 5.h,
      ),
      CustomTextInputField(
        context: context,
        obscureText: state.isPasswordVisible,
        type: InputType.text,
        hintLabel: '* * * * * * *',
        controller: state.passwordController,
        hintStyle:
       Theme.of(context).textTheme.displayLarge,
        validator: (value) => Validation.validatePassword(value!),
        suffixIcon: IconButton(onPressed: (){
          context.read<SignupBloc>().add(ToggleSPasswordVisibilityEvent());
        }, icon: Icon(
          state.isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 20,
        ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Text("Confirm Password",
          style: Theme.of(context).textTheme.bodyLarge),
      SizedBox(
        height: 5.h,
      ),
      CustomTextInputField(
        context: context,
        obscureText: state.isConfirmPasswordVisible,
        type: InputType.text,
        hintLabel: '* * * * * * *',
        controller: state.confirmPasswordController,
        hintStyle:
        Theme.of(context).textTheme.displayLarge,
        validator: (value) => Validation.validateConfirmPassword(value!,state.passwordController!.text),
        suffixIcon: IconButton(onPressed: (){
          context.read<SignupBloc>().add(ToggleConfirmPasswordVisibilityEvent());
        }, icon: Icon(
          state.isConfirmPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 20,
        )),
      ),
    ],
  );
}

Widget _buildGenderInput(BuildContext context,SignupState state){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Gender",
          style:Theme.of(context).textTheme.bodyLarge),
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          Row(
            children: [
              Radio<String>(
                value: 'Male',
                groupValue: state.gender,
                activeColor: Theme.of(context)
                    .customColors
                    .primaryColor, // Highlight selected with orange
                hoverColor: Colors.orange,
                onChanged: (value) {
                  context.read<SignupBloc>().add(OnGenderChangeEvent(value!));
                },
              ),
              Text(
                'Male',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            width: 50.w,
          ),
          Row(
            children: [
              Radio<String>(
                value: 'Female',
                groupValue: state.gender,
                activeColor: Theme.of(context)
                    .customColors
                    .primaryColor, // Highlight selected with orange
                hoverColor: Colors.orange,

                onChanged: (value) {
                  context.read<SignupBloc>().add(OnGenderChangeEvent(value!));
                },
              ),
              Text(
                'Female',
                style: TextStyle(fontSize: 15),
              ),
            ],
          )
        ],
      ),
    ],
  );
}

Widget _buildImageInput(BuildContext context,SignupState state){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Upload User Profile",
          style: Theme.of(context).textTheme.bodyLarge),
      SizedBox(
        height: 30.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DottedBorder(
            color: Colors.black,
            strokeWidth: 1,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            dashPattern: [13, 13],
            child: Container(
              height: 150.h,
              width: 250.w,
              decoration: BoxDecoration(
                color: Color(0XFFF8F8F8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: state.file != null? CustomImageView(imagePath: state.file!.path.toString(),fit: BoxFit.cover,) : GestureDetector(onTap: (){
                context.read<SignupBloc>().add(ImagePickedEvent());
              },child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath:
                    "assets/images/svgs/icons/ic_cloude.svg",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Select Image",
                    style: TextStyle(color: Color(0XFF2F2F2F)),
                  )
                ],
              ),) ,
            ),
          )
        ],
      ),
    ],
  );
}

Widget _buildHobbyInput(BuildContext context,SignupState state){
  final List<String> hobbies = ['Reading', 'Gaming', 'Traveling', 'Cooking'];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Hobby",
          style: Theme.of(context).textTheme.bodyLarge),
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          CommonCheckbox(
            value: state.selectedHobbies.contains(hobbies[0]),
            text: hobbies[0],
            onChanged: (_) {
              context.read<SignupBloc>().add(OnHobbyChangeEvent(hobbies[0]));
            },
          ),
          SizedBox(
            width: 60,
          ),
          CommonCheckbox(
            value: state.selectedHobbies.contains(hobbies[1]),
            text: hobbies[1],
            onChanged: (_) {
              context.read<SignupBloc>().add(OnHobbyChangeEvent(hobbies[1]));
            },
          ),
        ],
      ),
      Row(
        children: [
          CommonCheckbox(
            value: state.selectedHobbies.contains(hobbies[2]),
            text: hobbies[2],
            onChanged: (_) {
              context.read<SignupBloc>().add(OnHobbyChangeEvent(hobbies[2]));
            },
          ),
          SizedBox(
            width: 60,
          ),
          CommonCheckbox(
            value: state.selectedHobbies.contains(hobbies[3]),
            text: hobbies[3],
            onChanged: (_) {
              context.read<SignupBloc>().add(OnHobbyChangeEvent(hobbies[3]));
            },
          ),
        ],
      ),
    ],
  );
}