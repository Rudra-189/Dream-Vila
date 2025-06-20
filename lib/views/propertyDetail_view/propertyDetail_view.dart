import 'package:carousel_slider/carousel_slider.dart';
import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/productDetailModel.dart';
import 'package:dreamvila/viewmodels/propertyDetail_bloc/property_detail_bloc.dart';
import 'package:dreamvila/viewmodels/propertyDetail_bloc/property_detail_event.dart';
import 'package:dreamvila/viewmodels/propertyDetail_bloc/property_detail_state.dart';
import 'package:dreamvila/widgets/common_widget/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDetailView extends StatelessWidget {
  String id;
  PropertyDetailView({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<PropertyDetailBloc>().add(LoadProductDetailEvent(id));
    return Scaffold(
      body: BlocBuilder<PropertyDetailBloc, PropertyDetailState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildPropertyImages(context, state.data!.images,state),
                SizedBox(
                  height: 30.h,
                ),
                _buildPropertyDetail(context,state.data!)
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _buildPropertyImages(BuildContext context, List images,PropertyDetailState state) {
  return Column(
    children: [
      SizedBox(
        height: 50.h,
      ),
      CarouselSlider(
          items: images
              .map((e) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    shadowColor: Theme.of(context).customColors.borderColor,
                    child: CustomImageView(imagePath: e,height: 0.25.sh, width: 0.90.sw,radius: BorderRadius.circular(10),),
                  ))
              .toList(),
          options: CarouselOptions(
            height: 0.25.sh,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              context.read<PropertyDetailBloc>().add(ChangeIndexEvent(index));
            },
            scrollDirection: Axis.horizontal,
          )),
      SizedBox(
        height: 10.h,
      ),
      SizedBox(
        height: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color:  state.currentIndex == index
                    ? Theme.of(context).customColors.primaryColor
                    : Colors.black38,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),
    ],
  );
}

Widget _buildPropertyDetail(BuildContext context,ProductModel product) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
        ),
        SizedBox(
          height: 10.h,
        ),
        Card(
          color: Theme.of(context).customColors.secondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  product.description,
                  style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Price :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Discount :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Rating :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Type :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Plots :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Bedroom :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Hall :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Kitchen :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Washroom :",
                          style:
                              MyAppThemeHelper.lightTheme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.address,
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium!
                              .copyWith(overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "\$ ${product.price}",
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "${product.discountPercentage} % Discount  ",
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "${product.rating} / 5",
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          product.type,
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Plots ${product.plot}",
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          product.bedroom.toString(),
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          product.hall.toString(),
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          product.kitchen.toString(),
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          product.washroom.toString(),
                          style: MyAppThemeHelper
                              .lightTheme.textTheme.displayMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
