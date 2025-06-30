import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/models/property_model/product_detail_model.dart';
import 'package:dreamvila/views/property_detail_view/widget/propertyDetail_Shimmer.dart';

import 'package:flutter/material.dart';

class PropertyDetailView extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return PropertyDetailView(id: '');
  }

  final String id;
  const PropertyDetailView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<PropertyDetailBloc>().add(LoadProductDetailEvent(id));
    return Scaffold(
      body: BlocBuilder<PropertyDetailBloc, PropertyDetailState>(
        builder: (context, state) {
          if (state.detailPagestatus == Status.loading) {
            return PropertyDetailShimmer.buildPropertyDetailShimmer(context);
          } else if (state.detailPagestatus == Status.success) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildPropertyImages(context, state),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                          children: [
                            TextSpan(
                              text: Lang.of(context).lbl_limited_time,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            WidgetSpan(child: SizedBox(width: 8.w)),
                            TextSpan(
                              text: state.data?.data?.title,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            WidgetSpan(child: SizedBox(width: 8.w)),
                            TextSpan(
                              text: Lang.of(context).lbl_is_coming_back,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  _buildPropertyDetail(context, state.data?.data),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text(state.errorMessage));
          }
        },
      ),
    );
  }
}

Widget _buildPropertyImages(BuildContext context, PropertyDetailState state) {
  final List images = state.data?.data?.images ?? [];
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
                    color: Theme.of(context).customColors.secondaryColor,
                    shadowColor: Theme.of(context).customColors.borderColor,
                    child: CustomImageView(
                      imagePath: e,
                      height: 0.25.sh,
                      width: 0.90.sw,
                      radius: BorderRadius.circular(10.r),
                    ),
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
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return Container(
              height: 7.h,
              width: 7.h,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: state.currentIndex == index
                    ? Theme.of(context).customColors.primaryColor
                    : Theme.of(context).customColors.cardLowerTextColor,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),
    ],
  );
}

Widget _buildPropertyDetail(BuildContext context, ProductData? product) {
  if (product == null) {
    return Center(
      child: Text(Lang.of(context).lbl_no_data_found),
    );
  }
  final Map<String, String> details = {
    "Location": product.address.toString(),
    "Price": "\$ ${product.price}",
    "Discount": "${product.discountPercentage} %",
    "Rating": "${product.rating} / 5",
    "Type": product.type.toString(),
    "Plots": "Plots ${product.plot}",
    "Bedroom": product.bedroom.toString(),
    "Hall": product.hall.toString(),
    "Kitchen": product.kitchen.toString(),
    "Washroom": product.washroom.toString(),
  };

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Lang.of(context).lbl_description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 10.h),
        Card(
          color: Theme.of(context).customColors.secondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.description.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 20.h),
                Table(
                  columnWidths: const {
                    0: IntrinsicColumnWidth(), // label column adjusts to its width
                    1: FlexColumnWidth(), // value column takes remaining space
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: details.entries.map((entry) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "${entry.key} :",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            entry.value,
                            style: Theme.of(context).textTheme.displayMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
