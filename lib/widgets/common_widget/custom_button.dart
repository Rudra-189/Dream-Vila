import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.margin,
    this.onPressed,
    this.buttonStyle,
    this.alignment,
    this.buttonTextStyle,
    this.isDisabled = false,
    this.height,
    this.width,
    this.iconSpacing,
    this.isLoading = false,
    this.secondary = false,
    this.borderRadius,
    required this.text,
  });

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final Alignment? alignment;
  final TextStyle? buttonTextStyle;
  final bool isDisabled;
  final double? height;
  final double? width;
  final double? iconSpacing;
  final bool isLoading;
  final String text;
  final bool secondary;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 52.h,
      width: width ?? MediaQuery.of(context).size.width,
      margin: margin,
      decoration: decoration,
      child: ElevatedButton(
        style:
            buttonStyle ??
            ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 12)),
              padding: EdgeInsets.zero,
              textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
        onPressed:
            isDisabled
                ? null
                : () {
                  HapticFeedback.lightImpact();
                  if (onPressed != null) onPressed!();
                },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            if (leftIcon != null && iconSpacing != null) SizedBox(width: iconSpacing),
            if (isLoading)
              const CupertinoActivityIndicator()
            else
              Text(
                text,
                style:
                    secondary
                        ? Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Theme.of(context).primaryColor,
                        )
                        : buttonTextStyle ??
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color:
                                  isDisabled
                                      ? Theme.of(context).disabledColor
                                      : Theme.of(context).colorScheme.onPrimary,
                            ),
              ),
            if (rightIcon != null && iconSpacing != null) SizedBox(width: iconSpacing),
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
  }
}
