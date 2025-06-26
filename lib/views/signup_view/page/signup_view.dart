import 'dart:io';

import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/models/auth_model/sign_up_model.dart';
import 'package:dreamvila/viewmodels/auth_bloc/auth_bloc.dart';
import 'package:dreamvila/viewmodels/auth_bloc/auth_event.dart';
import 'package:dreamvila/viewmodels/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';

class SignUpView extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const SignUpView();
  }

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: state.signUpFromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderDesign(context),
                    _buildCommonInput(context, state),
                    _buildGenderInput(context, state),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildImageInput(context, state),
                    SizedBox(
                      height: 30.h,
                    ),
                    _buildPasswordInput(context, state),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildHobbyInput(context, state),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: CustomElevatedButton(
                        height: 0.060.sh,
                        width: 0.85.sw,
                        text: Lang.of(context).lbl_sign_up,
                        buttonTextStyle: TextStyle(
                          color: Theme.of(context).customColors.secondaryColor,
                          fontSize: 16,
                        ),
                        buttonStyle: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).customColors.primaryColor,
                        ),
                        isLoading: state.signUpStatus == status.loading ? true : false,
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
    if (state.signUpFromKey.currentState!.validate()) {
      final user = SignupModel(
        firstName: state.firstNameController.text,
        lastName: state.lastNameController.text,
        email: state.emailController.text,
        mobile: state.mobileController.text,
        gender: state.gender == Lang.of(context).lbl_male ? 1 : 2,
        hobbies: state.selectedHobbies.join(","),
        image: state.file,
        password: state.passwordController.text,
      );
      context.read<AuthBloc>().add(SignupSubmittedEvent(user));
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
            Lang.of(context).lbl_sign_up,
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

Widget _buildCommonInput(BuildContext context, AuthState state) {
  return Column(
    children: [
      LabeledTextField(
        label: Lang.of(context).lbl_first_name,
        controller: state.firstNameController,
        inputType: InputType.text,
        validator: (value) => Validation.validateName(value!),
      ),
      LabeledTextField(
        label: Lang.of(context).lbl_last_name,
        controller: state.lastNameController,
        inputType: InputType.text,
        validator: (value) => Validation.validateName(value!),
      ),
      LabeledTextField(
        label: Lang.of(context).lbl_email,
        controller: state.emailController,
        hint: Lang.of(context).lbl_email_hint,
        inputType: InputType.text,
        validator: (value) => Validation.validateEmail(value!),
      ),
      LabeledTextField(
        label: Lang.of(context).lbl_mobil,
        controller: state.mobileController,
        hint: Lang.of(context).lbl_mobil_hint,
        inputType: InputType.phoneNumber,
        validator: (value) => Validation.validateMobile(value!),
      ),
    ],
  );
}

Widget _buildPasswordInput(BuildContext context, AuthState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabeledTextField(
        label: Lang.of(context).lbl_password,
        obscureText: state.isPasswordVisible,
        controller: state.passwordController,
        hint: Lang.of(context).lbl_password_hint,
        inputType: InputType.text,
        validator: (value) => Validation.validatePassword(value!),
        suffixIcon: IconButton(
          onPressed: () {
            context.read<AuthBloc>().add(TogglePasswordVisibilityEvent());
          },
          icon: Icon(
            state.isPasswordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 20,
          ),
        ),
      ),
      LabeledTextField(
        label: Lang.of(context).lbl_confirm_password,
        obscureText: state.isConfirmPasswordVisible,
        controller: state.confirmPasswordController,
        hint: Lang.of(context).lbl_password_hint,
        inputType: InputType.text,
        validator: (value) => Validation.validateConfirmPassword(
            value!, state.passwordController.text),
        suffixIcon: IconButton(
            onPressed: () {
              context
                  .read<AuthBloc>()
                  .add(ToggleConfirmPasswordVisibilityEvent());
            },
            icon: Icon(
              state.isConfirmPasswordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 20,
            )),
      ),
    ],
  );
}

Widget _buildGenderInput(BuildContext context, AuthState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(Lang.of(context).lbl_gender,
          style: Theme.of(context).textTheme.bodyLarge),
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          CommonRadioButton(
              label: Lang.of(context).lbl_male,
              selectedGender: state.gender,
              onChanged: (value) {
                context.read<AuthBloc>().add(OnGenderChangeEvent(value!));
              }),
          SizedBox(
            width: 50.w,
          ),
          CommonRadioButton(
              label: Lang.of(context).lbl_female,
              selectedGender: state.gender,
              onChanged: (value) {
                context.read<AuthBloc>().add(OnGenderChangeEvent(value!));
              })
        ],
      ),
    ],
  );
}

Widget _buildImageInput(BuildContext context, AuthState state) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(Lang.of(context).lbl_upload_user_profile, style: Theme.of(context).textTheme.bodyLarge),
      SizedBox(height: 30.h),
      Center(
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: const [13, 13],
          child: GestureDetector(
            onTap: (){
              context.read<AuthBloc>().add(ImagePickedEvent());
            },
            child: state.file != null
                ? CustomImageView(imagePath: state.file!.path,height: 150.h,width: 250.w,radius: BorderRadius.circular(10.r),)
                : Container(
              height: 150.h,
              width: 250.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: Assets.images.svgs.icons.icCloud.path,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Select Image",
                    style: TextStyle(color: Color(0xFF2F2F2F)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildHobbyInput(BuildContext context, AuthState state) {
  final List<String> hobbies = ['Reading', 'Gaming', 'Traveling', 'Cooking'];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Hobby", style: Theme.of(context).textTheme.bodyLarge),
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          CommonCheckbox(
            value: state.selectedHobbies.contains(hobbies[0]),
            text: hobbies[0],
            onChanged: (_) {
              context.read<AuthBloc>().add(OnHobbyChangeEvent(hobbies[0]));
            },
          ),
          SizedBox(
            width: 60,
          ),
          CommonCheckbox(
            value: state.selectedHobbies.contains(hobbies[1]),
            text: hobbies[1],
            onChanged: (_) {
              context.read<AuthBloc>().add(OnHobbyChangeEvent(hobbies[1]));
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
              context.read<AuthBloc>().add(OnHobbyChangeEvent(hobbies[2]));
            },
          ),
          SizedBox(
            width: 60,
          ),
          CommonCheckbox(
            value: state.selectedHobbies.contains(hobbies[3]),
            text: hobbies[3],
            onChanged: (_) {
              context.read<AuthBloc>().add(OnHobbyChangeEvent(hobbies[3]));
            },
          ),
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
            Lang.of(context).lbl_already_have_an_account,
            style: TextStyle(color: const Color(0xFF000000), fontSize: 15.sp),
          ),
          InkWell(
            onTap: (){
              NavigatorService.pushNamedAndRemoveUntil(
              AppRoutes.signInScreen);
            },
            child: Text(
              Lang.of(context).lbl_sign_in,
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