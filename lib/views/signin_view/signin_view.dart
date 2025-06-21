import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context,state){
          if(state.signInStatus == status.success){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.signInScreen, (Route<dynamic> route) => false);
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
                    BuildCommonAuthDesign(label: "Sign In",),
                    LabeledTextField(label: 'Email', controller: state.emailController!, inputType: InputType.email,validator: (value) => Validation.validateEmail(value!),),
                    Text("Password",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.text,
                      hintLabel: '* * * * * * *',
                      controller: state.passwordController,
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
                    CommonAuthFooter(
                      buttonText: "Sign In",
                      footerText: "Don’t have an account? ",
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
    if (_formKey.currentState!.validate()) {
      context.read<SignInBloc>().add(OnLoginButtonEvent(state.emailController!.text, state.passwordController!.text));
    }
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.homeScreen,(Route<dynamic> route) => false,);
  }
}
