import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:dreamvila/widgets/common_widget/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_button.dart';

class CommonAuthFooter extends StatelessWidget {
  final String buttonText;
  final String footerText;
  final VoidCallback onActionTap;
  final VoidCallback onButtonTap;
  final bool isLoading;

  const CommonAuthFooter({
    super.key,
    required this.buttonText,
    required this.footerText,
    required this.onActionTap,
    required this.onButtonTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primary button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              height: 0.060.sh,
              width: 0.85.sw,
              text: buttonText,
              buttonTextStyle: TextStyle(
                color: Theme.of(context).customColors.secondaryColor,
                fontSize: 16,
              ),
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).customColors.primaryColor,
              ),
              isLoading: isLoading,
              onPressed: onButtonTap,
            ),
          ],
        ),

        SizedBox(height: 40.h),

        // Footer text + action
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              footerText,
              style: TextStyle(color: const Color(0xFF000000), fontSize: 15.sp),
            ),
            InkWell(
              onTap: onActionTap,
              child: Text(
                buttonText,
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
}
