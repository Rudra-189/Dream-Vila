import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

class PropertyDetailView extends StatelessWidget {
  String id;
  PropertyDetailView({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<PropertyDetailBloc>().add(LoadProductDetailEvent(id));
    return Scaffold(
      body: BlocBuilder<PropertyDetailBloc, PropertyDetailState>(
        builder: (context, state) {
          if(state.detailPageStatus == status.loading){
            return Center(child: CircularProgressIndicator());
          }else if(state.detailPageStatus == status.success){
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildPropertyImages(context, state.data!.images,state),
                  SizedBox(
                    height: 30.h,
                  ),
                  _buildPropertyDetail(context,state.data!),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            );
          }else{
            return Center(child: Text(state.errorMessage));
          }
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
              height: 7.h,
              width: 7.h,
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
Widget _buildPropertyDetail(BuildContext context, ProductModel product) {
  final Map<String, String> details = {
    "Location": product.address,
    "Price": "\$ ${product.price}",
    "Discount": "${product.discountPercentage} %",
    "Rating": "${product.rating} / 5",
    "Type": product.type,
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
          "Description",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 10.h),
        Card(
          color: Theme.of(context).customColors.secondaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.description,
                  style:Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 20.h),
                Table(
                  columnWidths: const {
                    0: IntrinsicColumnWidth(), // label column adjusts to its width
                    1: FlexColumnWidth(),      // value column takes remaining space
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  children: details.entries.map((entry) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
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

