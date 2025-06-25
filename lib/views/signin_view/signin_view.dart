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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.signInStatus == status.success) {
            NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: state.signInFromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildCommonAuthDesign(
                      label: Lang.of(context).lbl_sign_in,
                    ),
                    _buildCommonInput(context,state),
                    SizedBox(
                      height: 100.h,
                    ),
                    CommonAuthFooter(
                      buttonText: Lang.of(context).lbl_sign_in,
                      footerText: Lang.of(context).lbl_do_not_have_an_account,
                      onActionTap: () {
                        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.signupScreen);
                      },
                      onButtonTap: () {
                        _submit(context, state);
                      },
                      isLoading: state.signInStatus == status.loading,
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

  void _submit(BuildContext context, AuthState state) async {
    if (state.signInFromKey.currentState!.validate()) {
      context.read<AuthBloc>().add(OnLoginButtonEvent(
          state.signInEmailController.text, state.signInPasswordController.text));
    }
  }
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