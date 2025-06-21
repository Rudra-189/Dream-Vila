import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/theme_helper.dart';
import '../../core/utils/validation.dart';
import 'custom_textfields.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final InputType inputType;
  final int? maxLines;
  final String? Function(String?)? validator;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.inputType,
    this.maxLines,
    this.validator,
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
          type: inputType,
          hintLabel: label,
          controller: controller,
          hintStyle: textTheme.displayLarge,
          validator: validator ?? (value) => Validation.validateNotEmpty(value!, label),
          maxLines: maxLines ?? 1,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
