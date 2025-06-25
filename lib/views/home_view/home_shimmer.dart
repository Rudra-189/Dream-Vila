
  import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/exports.dart';


class HomeShimmer{
  static Widget buildHomePageSimmer(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 50.h),
          buildUserInfoShimmer(context),
          SizedBox(height: 20.h),
          buildTabBarShimmer(context),
          SizedBox(height: 10.h),
          Expanded(child: buildPropertyListShimmer(context)),
        ],
      ),
    );
  }
  static Widget buildUserInfoShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 75.h,
                width: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(height: 16.h, width: 120.w, color: Colors.white),
                  SizedBox(height: 10.h),
                  Container(height: 16.h, width: 180.w, color: Colors.white),
                ],
              )
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: 16.h, width: 120.w, color: Colors.white),
              Container(height: 45.h,width: 125.w,color: Colors.white,)
            ],
          )
        ],
      ),
    );
  }

  static Widget buildTabBarShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return Container(
            height: 40.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
          );
        }),
      ),
    );
  }

  static Widget buildPropertyListShimmer(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 85.h,
                width: 85.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 16.h, width: double.infinity, color: Colors.white),
                    SizedBox(height: 8.h),
                    Container(height: 14.h, width: 150.w, color: Colors.white),
                    SizedBox(height: 8.h),
                    Container(height: 12.h, width: 200.w, color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

}

