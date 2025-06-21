import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_view.dart';

class BuildCommonAuthDesign extends StatelessWidget {
  const BuildCommonAuthDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: "assets/images/pngs/app_logo.png",
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
              "Sign Up",
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
}
