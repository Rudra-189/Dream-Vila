import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/viewmodels/auth_bloc/auth_bloc.dart';
import 'package:dreamvila/viewmodels/auth_bloc/auth_event.dart';
import 'package:dreamvila/viewmodels/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const SignInView();
  }
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: state.signInFromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderDesign(context),
                    _buildCommonInput(context,state),
                    SizedBox(
                      height: 100.h,
                    ),
                    Center(
                      child: CustomElevatedButton(
                        height: 0.060.sh,
                        width: 0.85.sw,
                        text: Lang.of(context).lbl_sign_in,
                        buttonTextStyle: TextStyle(
                          color: Theme.of(context).customColors.secondaryColor,
                          fontSize: 16,
                        ),
                        buttonStyle: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).customColors.primaryColor,
                        ),
                        isLoading: state.signInStatus == status.loading ? true : false,
                        onPressed: () {
                          _submit(context, state);
                        },
                      ),
                    ),
                    _buildFooterDesign(context)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _submit(BuildContext context, AuthState state) async {
    if (state.signInFromKey.currentState!.validate()) {
      context.read<AuthBloc>().add(OnLoginButtonEvent(
          state.signInEmailController.text, state.signInPasswordController.text));
    }
  }
}

Widget _buildHeaderDesign(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 50.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: Assets.images.pngs.appLogo.path,
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
            Lang.of(context).lbl_sign_in,
            style: TextStyle(
                color: Theme.of(context).customColors.primaryColor,
                fontSize: 30.sp),
          )
        ],
      ),
      SizedBox(
        height: 50.h,
      ),
    ],
  );
}

Widget _buildCommonInput(BuildContext context,AuthState state){
  return Column(
    children: [
      LabeledTextField(
        label: Lang.of(context).lbl_email,
        controller: state.signInEmailController,
        inputType: InputType.email,
        validator: (value) => Validation.validateEmail(value!),
      ),
      LabeledTextField(
        obscureText: state.isPasswordVisible,
        label: Lang.of(context).lbl_password,
        hint: Lang.of(context).lbl_password_hint,
        controller: state.signInPasswordController,
        inputType: InputType.text,
        validator: (value) => Validation.validatePassword(value!),
        suffixIcon: IconButton(
          onPressed: () {
            context
                .read<AuthBloc>()
                .add(TogglePasswordVisibilityEvent());
          },
          icon: Icon(
            state.isPasswordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 20,
          ),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(Lang.of(context).lbl_forgot_password,style: Theme.of(context).textTheme.displayMedium,)
        ],
      ),
    ],
  );
}

Widget _buildFooterDesign(BuildContext context) {
  return Column(
    children: [
      // Primary button
      SizedBox(height: 40.h),

      // Footer text + action
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Lang.of(context).lbl_do_not_have_an_account,
            style: TextStyle(color: const Color(0xFF000000), fontSize: 15.sp),
          ),
          InkWell(
            onTap: (){
              NavigatorService.pushNamedAndRemoveUntil(
                  AppRoutes.signupScreen);
            },
            child: Text(
              Lang.of(context).lbl_sign_up,
              style: TextStyle(
                color: Theme.of(context).customColors.primaryColor,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),

      SizedBox(height: 30.h),

      // Social buttons (SVG image)
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(imagePath: Assets.images.svgs.authButtons.path),
        ],
      ),

      SizedBox(height: 50.h),
    ],
  );
}