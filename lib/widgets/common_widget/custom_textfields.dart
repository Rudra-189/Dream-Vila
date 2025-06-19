import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextInputField extends TextFormField {
  CustomTextInputField({
    super.key,
    required BuildContext context,
    required InputType type,
    required String hintLabel,
    required super.controller,
    super.textInputAction = TextInputAction.next,
    super.maxLines,
    super.minLines,
    super.autovalidateMode = AutovalidateMode.onUnfocus,
    super.validator,
    super.enabled,
    super.readOnly,
    super.expands,
    bool? obscureText,
    super.obscuringCharacter,
    TextInputType? keyboardType,
    Iterable<String>? autoFillHints,
    Widget? suffixIcon,
    Widget? prefixIcon,
    BoxConstraints? boxConstraints,
    List<TextInputFormatter>? inputFormatters,
    EdgeInsetsGeometry? contentPadding,
    Color? fillColor,
    bool? filled,
    TextStyle? hintStyle,
    bool isCapitalized = false,
    String? label,
    bool suffixText = false,

    super.onTap,
    super.onChanged,
    Function(String)? super.onFieldSubmitted,
    super.focusNode,
    super.maxLength,
  }) : assert(
         type != InputType.multiline || textInputAction == TextInputAction.newline,
         'Make textInputAction = TextInputAction.newline',
       ),
       assert(
         (type != InputType.password && type != InputType.newPassword && type != InputType.confirmPassword) ||
             obscureText != null,
         'Make sure your providing obscureText and Wrap Obx on TextInputField',
       ),
       super(
         keyboardType:
             keyboardType ??
             switch (type) {
               InputType.name => TextInputType.name,
               InputType.text => TextInputType.text,
               InputType.email => TextInputType.emailAddress,
               InputType.password => TextInputType.visiblePassword,
               InputType.confirmPassword => TextInputType.visiblePassword,
               InputType.newPassword => TextInputType.visiblePassword,
               InputType.phoneNumber => TextInputType.phone,
               InputType.digits => TextInputType.number,
               InputType.decimalDigits => const TextInputType.numberWithOptions(decimal: true),
               InputType.multiline => TextInputType.multiline,
             },
         autofillHints: [
           if (autoFillHints != null) ...autoFillHints,
           switch (type) {
             InputType.name => AutofillHints.name,
             InputType.email => AutofillHints.email,
             InputType.password => AutofillHints.password,
             InputType.confirmPassword => AutofillHints.password,
             InputType.newPassword => AutofillHints.newPassword,
             InputType.phoneNumber => AutofillHints.telephoneNumber,
             _ => '',
           },
         ],
         textCapitalization: isCapitalized ? TextCapitalization.words : TextCapitalization.none,
         inputFormatters: [
           if (inputFormatters != null) ...inputFormatters,
           if (type == InputType.digits) FilteringTextInputFormatter.digitsOnly,
           if (type == InputType.decimalDigits) FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
         ],
         obscureText: obscureText ?? false,
         textAlignVertical: TextAlignVertical.top,
         style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
         decoration: InputDecoration(
           hintStyle:
               hintStyle ??
               Theme.of(context).textTheme.bodyMedium!.copyWith(
                 fontSize: 18.sp,
                 // color: Theme.of(context).customColors.hinttextcolor,
                 fontWeight: FontWeight.w400,
               ),
           hintText: hintLabel,
           label:
               label != null
                   ? Text(
                     label,
                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                       fontSize: 18.sp,
                       // color: Theme.of(context).customColors.hinttextcolor,
                       fontWeight: FontWeight.w400,
                     ),
                   )
                   : null,
           contentPadding: contentPadding ?? const EdgeInsets.all(16),
           prefixIcon: prefixIcon != null ? SizedBox(height: 22, width: 22, child: prefixIcon) : null,
           prefixIconConstraints: boxConstraints,
           // fillColor: fillColor ?? Theme.of(context).customColors.fillColor,
           filled: filled ?? true,
           suffixIcon:
               suffixText
                   ? suffixIcon
                   : suffixIcon != null
                   ? SizedBox(height: 22, width: 22, child: suffixIcon)
                   : null,
         ),
       );
}

enum InputType {
  name,
  text,
  email,
  password,
  confirmPassword,
  newPassword,
  phoneNumber,
  digits,
  decimalDigits,
  multiline,
}
