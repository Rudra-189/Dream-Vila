import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDetailShimmer{

  static Widget buildPropertyDetailShimmer(BuildContext context){
    return Column(
      children: [
        buildImageCarouselShimmer(context),
        SizedBox(height: 30.h),
        buildDetailsCardShimmer(context),
        SizedBox(height: 30.h),
      ],
    );
  }

  static Widget buildImageCarouselShimmer(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 0.25.sh,
            width: 0.9.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
                (index) => Container(
              height: 7.h,
              width: 7.h,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),
        )
      ],
    );
  }

  static Widget buildDetailsCardShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16.h,
                  width: 100.w,
                  color: Colors.white,
                ),
                SizedBox(height: 20.h),
                Container(height: 14.h, width: double.infinity, color: Colors.white),
                SizedBox(height: 10.h),
                Container(height: 14.h, width: double.infinity, color: Colors.white),
                SizedBox(height: 10.h),
                Container(height: 14.h, width: double.infinity, color: Colors.white),
                SizedBox(height: 10.h),
                Container(height: 14.h, width: double.infinity, color: Colors.white),
                SizedBox(height: 10.h),
                Container(height: 14.h, width: double.infinity, color: Colors.white),
                SizedBox(height: 10.h),
                Container(height: 14.h, width: double.infinity, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
