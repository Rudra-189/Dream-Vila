import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDetailShimmer{

  static Widget buildPropertyDetailShimmer(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImageShimmer(context),
          SizedBox(height: 30.h),
          _buildDetailShimmer(context),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  static Widget _buildImageShimmer(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 0.25.sh,
            width: 0.90.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              height: 7.h,
              width: 7.h,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }

  static Widget _buildDetailShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 100.w,
              height: 20.h,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Card(
              color: Theme.of(context).customColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80.h,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20.h),
                    ...List.generate(10, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 16.h,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Container(
                                height: 16.h,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}