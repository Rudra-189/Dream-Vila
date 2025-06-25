import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_view.dart';

class BuildCommonAuthDesign extends StatelessWidget {
  final String label;
  const BuildCommonAuthDesign({super.key,required this.label});

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
              label,
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
