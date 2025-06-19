

import 'package:dotted_border/dotted_border.dart';
import 'package:dreamvila/core/routes/app_routes.dart';
import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/core/utils/validation.dart';
import 'package:dreamvila/models/signUpModel.dart';
import 'package:dreamvila/viewmodels/signup_bloc/signup_event.dart';
import 'package:dreamvila/widgets/common_widget/common_checkbox.dart';
import 'package:dreamvila/widgets/common_widget/custom_button.dart';
import 'package:dreamvila/widgets/common_widget/custom_textfields.dart';
import 'package:dreamvila/widgets/common_widget/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../viewmodels/signup_bloc/signup_bloc.dart';
import '../../viewmodels/signup_bloc/signup_state.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  final List<String> _hobbies = ['Reading', 'Gaming', 'Traveling', 'Cooking'];

  @override
  void dispose() {
    super.dispose();
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    mobileController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context,state){
          if(state.signUpStatus == status.success){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.homeScreen,(Route<dynamic> route) => false);
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
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: "assets/images/pngs/app_logo.png",
                          height: 50.h,
                          width: 200.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Theme.of(context).customColors.primaryColor,
                              fontSize: 30.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text("First Name",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.name,
                      hintLabel: 'First Name',
                      controller: firstNameController,
                      hintStyle: MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) => Validation.validateName(value!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Last Name",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.name,
                      hintLabel: 'Last Name',
                      controller: lastNameController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) => Validation.validateName(value!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Email",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.email,
                      hintLabel: 'abc@gmail.com',
                      controller: emailController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) => Validation.validateEmail(value!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Mobile",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                        context: context,
                        type: InputType.phoneNumber,
                        hintLabel: '+91',
                        controller: mobileController,
                        hintStyle:
                            MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                    validator: (value) => Validation.validateMobile(value!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Gender",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Upload User Profile",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
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
                    SizedBox(
                      height: 30.h,
                    ),
                    Text("Password",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      obscureText: state.isPasswordVisible,
                      type: InputType.text,
                      hintLabel: '* * * * * * *',
                      controller: passwordController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) => Validation.validatePassword(value!),
                      suffixIcon: IconButton(onPressed: (){
                        context.read<SignupBloc>().add(TogglePasswordVisibilityEvent());
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
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      obscureText: state.isConfirmPasswordVisible,
                      type: InputType.text,
                      hintLabel: '* * * * * * *',
                      controller: confirmPasswordController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) => Validation.validateConfirmPassword(value!,passwordController.text),
                      suffixIcon: IconButton(onPressed: (){
                        context.read<SignupBloc>().add(ToggleConfirmPasswordVisibilityEvent());
                      }, icon: Icon(
                        state.isConfirmPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 20,
                      )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Hobby",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        CommonCheckbox(
                          value: state.selectedHobbies.contains(_hobbies[0]),
                          text: _hobbies[0],
                          onChanged: (_) {
                            context.read<SignupBloc>().add(OnHobbyChangeEvent(_hobbies[0]));
                          },
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CommonCheckbox(
                          value: state.selectedHobbies.contains(_hobbies[1]),
                          text: _hobbies[1],
                          onChanged: (_) {
                            context.read<SignupBloc>().add(OnHobbyChangeEvent(_hobbies[1]));
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CommonCheckbox(
                          value: state.selectedHobbies.contains(_hobbies[2]),
                          text: _hobbies[2],
                          onChanged: (_) {
                            context.read<SignupBloc>().add(OnHobbyChangeEvent(_hobbies[2]));
                          },
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CommonCheckbox(
                          value: state.selectedHobbies.contains(_hobbies[3]),
                          text: _hobbies[3],
                          onChanged: (_) {
                            context.read<SignupBloc>().add(OnHobbyChangeEvent(_hobbies[3]));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          height: 0.060.sh,
                          width: 0.85.sw,
                          text: 'Sign Up',
                          buttonTextStyle:TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                          buttonStyle: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XFFFF6F42),
                          ),
                          onPressed: () {
                            _submit(context, state);
                          },
                          isLoading: state.signUpStatus == status.loading ? true : false,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                              color: Color(0xFF000000), fontSize: 15.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.signInScreen);
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                color:
                                    Theme.of(context).customColors.primaryColor,
                                fontSize: 15.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: "assets/images/svgs/auth_buttons.svg",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
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
      final user = UserModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        mobile: mobileController.text,
        gender: state.gender == 'Male' ? 1 : 2,
        hobbies: state.selectedHobbies.join(","),
        image: state.file,
        password: passwordController.text,
      );
      context.read<SignupBloc>().add(SignupSubmittedEvent(user));
    }
  }
}
