// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/theme_helper.dart';
import '../../core/utils/validation.dart';
import 'custom_textfields.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String? hint;
  bool? obscureText;
  final TextEditingController controller;
  final InputType inputType;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  bool? readOnly;

  LabeledTextField({
    super.key,
    required this.label,
    this.obscureText,
    this.hint,
    required this.controller,
    required this.inputType,
    this.maxLines,
    this.validator,
    this.suffixIcon,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppThemeHelper.lightTheme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.bodyLarge),
        SizedBox(height: 5.h),
        CustomTextInputField(
          context: context,
          readOnly: readOnly ?? false,
          obscureText: obscureText,
          type: inputType,
          hintLabel: hint ?? label,
          controller: controller,
          hintStyle: textTheme.displayLarge,
          validator: validator ??
              (value) => Validation.validateNotEmpty(value!, label),
          maxLines: maxLines ?? 1,
          suffixIcon: suffixIcon,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
