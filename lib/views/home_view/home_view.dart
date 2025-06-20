import 'dart:io';

import 'package:dreamvila/core/routes/app_routes.dart';
import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/productDataModel.dart';
import 'package:dreamvila/models/signUpModel.dart';
import 'package:dreamvila/models/userModel.dart';
import 'package:dreamvila/viewmodels/home_bloc/home_bloc.dart';
import 'package:dreamvila/viewmodels/home_bloc/home_event.dart';
import 'package:dreamvila/viewmodels/home_bloc/home_state.dart';
import 'package:dreamvila/widgets/common_widget/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHomePageDataEvent());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if(state.homeStatus == status.loading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state.homeStatus == status.success){
              final data = state.data;
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      _buildUserInfo(context,state.user!),
                      _buildTabView(context),
                      SizedBox(
                        height: 10.h,
                      ),
                      _buildPropertyList(context,data!)
                    ],
                  ),
                ),
              );
            }else{
              return Center(child: Text(state.errorMessage));
            }
          },
        ),
      ),
    );
  }
}

Widget _buildUserInfo(BuildContext context,UserModel user) {
  return SizedBox(
    height: 150.h,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //user Image
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border(
                    top: BorderSide(
                        color: Theme.of(context).customColors.secondaryColor,
                        width: 3.w),
                    bottom: BorderSide(
                        color: Theme.of(context).customColors.secondaryColor,
                        width: 3.w),
                    left: BorderSide(
                        color: Theme.of(context).customColors.secondaryColor,
                        width: 3.w),
                    right: BorderSide(
                        color: Theme.of(context).customColors.secondaryColor,
                        width: 3.w),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).customColors.borderColor,
                        offset: Offset(2, 2),
                        blurRadius: 10)
                  ]),
              child: CustomImageView(imagePath: 'https://interview.flexioninfotech.com/uploads/${user.image}',fit: BoxFit.cover,radius: BorderRadius.circular(10.r),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hello!",
                  style: MyAppThemeHelper.lightTheme.textTheme.titleLarge,
                ),
                Text(
                  "Mr. Smith",
                  style: MyAppThemeHelper.lightTheme.textTheme.titleLarge,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user.email,
              style: MyAppThemeHelper.lightTheme.textTheme.titleMedium,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border(
                  top: BorderSide(
                      color: Theme.of(context)
                          .customColors
                          .primaryColor
                          .withOpacity(0.25),
                      width: 1.w),
                  bottom: BorderSide(
                      color: Theme.of(context)
                          .customColors
                          .primaryColor
                          .withOpacity(0.25),
                      width: 1.w),
                  left: BorderSide(
                      color: Theme.of(context)
                          .customColors
                          .primaryColor
                          .withOpacity(0.25),
                      width: 1.w),
                  right: BorderSide(
                      color: Theme.of(context)
                          .customColors
                          .primaryColor
                          .withOpacity(0.25),
                      width: 1.w),
                ),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(AppRoutes.addProductScreen);
                },
                child: Text(
                  "+Add Property",
                  style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget _buildTabView(BuildContext context) {
  return TabBar(
    onTap: (int value) {
      print(value);
    },
    labelColor: Theme.of(context).customColors.primaryColor,
    unselectedLabelColor: Colors.black54,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
    labelPadding: EdgeInsets.all(0.r),
    indicator: ShapeDecoration(
        color: Theme.of(context).customColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        shadows: [
          BoxShadow(
              color: Theme.of(context).customColors.borderColor,
              offset: Offset(-1, 1),
              blurRadius: 5.r)
        ]),
    tabs: [
      Tab(text: 'House'),
      Tab(text: 'Apartment'),
      Tab(text: 'Office'),
      Tab(text: 'Land'),
    ],
  );
}

Widget _buildPropertyList(BuildContext context,PropertyResponse data) {
  return Expanded(
    child: ListView.builder(
      itemBuilder: (context, index) {
        final property = data.data[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.propertyDetailScreen,arguments: property.id);
          },
          child: Card(
            color: Colors.white,
            shadowColor: Theme.of(context).customColors.borderColor,
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CustomImageView(imagePath: property.images[0],height: 85.h,width: 85.h,radius: BorderRadius.circular(10),),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(property.title,
                                style: MyAppThemeHelper
                                    .lightTheme.textTheme.bodyLarge),
                            Text(
                              "\$ ${property.price.toString()}",
                              style: MyAppThemeHelper
                                  .lightTheme.textTheme.displayMedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.black54,
                              size: 18.sp,
                            ),
                            Text(property.address,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Plots ${property.plot.toString()}",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 10),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "|",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .customColors
                                      .primaryColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${property.discountPercentage} % Discount",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 10),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "|",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .customColors
                                      .primaryColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Theme.of(context)
                                      .customColors
                                      .primaryColor,
                                  size: 15,
                                ),
                                Text(
                                  property.rating.toString(),
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 10),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: data.data.length,
    ),
  );
}
