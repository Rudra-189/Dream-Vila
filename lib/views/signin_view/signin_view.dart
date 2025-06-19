

import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/viewmodels/signin_bloc/signin_event.dart';
import 'package:dreamvila/viewmodels/signin_bloc/signin_state.dart';
import 'package:dreamvila/viewmodels/signup_bloc/signup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/app_routes.dart';
import '../../core/utils/validation.dart';
import '../../viewmodels/signin_bloc/signin_bloc.dart';
import '../../widgets/common_widget/custom_button.dart';
import '../../widgets/common_widget/custom_textfields.dart';
import '../../widgets/common_widget/image_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context,state){
          if(state.signInStatus == status.success){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.homeScreen, (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          "Sign In",
                          style: TextStyle(
                              color: Theme.of(context).customColors.primaryColor,
                              fontSize: 30.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
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
                      hintStyle: MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) => Validation.validateEmail(value!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Password",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.text,
                      hintLabel: '* * * * * * *',
                      controller: passwordController,
                      hintStyle: MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                      ),
                      validator: (value) => Validation.validatePassword(value!),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Password?",
                            style:
                                TextStyle(color: Color(0XFFFF6F42), fontSize: 13))
                      ],
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          height: 0.060.sh,
                          width: 0.85.sw,
                          text: 'Sign Up',
                          buttonTextStyle: TextStyle(
                              color: Theme.of(context).customColors.secondaryColor,
                              fontSize: 16),
                          buttonStyle: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).customColors.primaryColor,
                          ),
                          isLoading: state.signInStatus == status.loading ? true : false,
                          onPressed: (){
                            _submit(context, state);
                          },
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
                          "Don’t have an account? ",
                          style:
                              TextStyle(color: Color(0xFF000000), fontSize: 15.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRoutes.signupScreen);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Theme.of(context).customColors.primaryColor,
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
  void _submit(BuildContext context, SignInState state) async {
    if (_formKey.currentState!.validate()) {
      context.read<SignInBloc>().add(OnLoginButtonEvent(emailController.text, passwordController.text));
    }
  }
}
