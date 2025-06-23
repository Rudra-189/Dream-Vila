import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.signInStatus == status.success) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.homeScreen, (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: state.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildCommonAuthDesign(
                      label: Lang.of(context).lbl_sign_in,
                    ),
                    LabeledTextField(
                      label: Lang.of(context).lbl_email,
                      controller: state.emailController,
                      inputType: InputType.email,
                      validator: (value) => Validation.validateEmail(value!),
                    ),
                    _buildCommonInput(context,state),
                    SizedBox(
                      height: 100.h,
                    ),
                    CommonAuthFooter(
                      buttonText: Lang.of(context).lbl_sign_in,
                      footerText: Lang.of(context).lbl_do_not_have_an_account,
                      onActionTap: () {
                        Navigator.pushNamed(context, AppRoutes.signupScreen);
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

  void _submit(BuildContext context, SignInState state) async {
    if (state.formKey.currentState!.validate()) {
      context.read<SignInBloc>().add(OnLoginButtonEvent(
          state.emailController.text, state.passwordController.text));
    }
  }
}

Widget _buildCommonInput(BuildContext context,SignInState state){
  return Column(
    children: [
      LabeledTextField(
        label: Lang.of(context).lbl_password,
        hint: Lang.of(context).lbl_password_hint,
        controller: state.passwordController,
        inputType: InputType.text,
        validator: (value) => Validation.validatePassword(value!),
        suffixIcon: IconButton(
          onPressed: () {
            context
                .read<SignInBloc>()
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
          Text(Lang.of(context).lbl_forgot_password,
              style: TextStyle(
                  color: Color(0XFFFF6F42), fontSize: 13))
        ],
      ),
    ],
  );
}