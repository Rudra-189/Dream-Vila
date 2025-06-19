import 'package:carousel_slider/carousel_slider.dart';
import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDetailView extends StatelessWidget {
  PropertyDetailView({super.key});

  final List<String> images = [
    'Image 1',
    'Image 2',
    'Image 3',
    'Image 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPropertyImages(context,images),
            SizedBox(height: 30.h,),
            _buildPropertyDetail(context)
          ],
        ),
      ),
    );
  }
}

Widget _buildPropertyImages(BuildContext context,List images){
  int _currentIndex = 0;
  return Column(
    children: [
      SizedBox(height: 50.h,),
      CarouselSlider(
          items: images.map((e)=>Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            shadowColor: Theme.of(context).customColors.borderColor,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 0.25.sh,
              width: 0.90.sw,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          )).toList(),
          options: CarouselOptions(
            height: 0.25.sh,
            aspectRatio: 16/9,
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
              _currentIndex = index;
            },
            scrollDirection: Axis.horizontal,
          )
      ),
      SizedBox(height: 10.h,),
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
                color: _currentIndex == index ? Theme.of(context).customColors.primaryColor : Colors.black38,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),
    ],
  );
}

Widget _buildPropertyDetail(BuildContext context){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
        SizedBox(height: 10.h,),
        Card(
          color: Theme.of(context).customColors.secondaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child:Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.",style: MyAppThemeHelper.lightTheme.textTheme.bodyMedium,),
                SizedBox(height: 25.h,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Price :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Discount :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Rating :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Type :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Plots :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Bedroom :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Hall :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Kitchen :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                        SizedBox(height: 25.h,),
                        Text("Washroom :",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge,),
                      ],
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("2BW Street, NY, New York",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium!.copyWith(overflow: TextOverflow.ellipsis),maxLines: 1,),
                        SizedBox(height: 25.h,),
                        Text("\$267000",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                        SizedBox(height: 25.h,),
                        Text("20 % Discount  ",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                        SizedBox(height: 25.h,),
                        Text("4.5 / 5",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                        SizedBox(height: 25.h,),
                        Text("Apartment",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                        SizedBox(height: 25.h,),
                        Text("Plots 1",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                        SizedBox(height: 25.h,),
                        Text("1",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                        SizedBox(height: 25.h,),
                        Text("1",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                        SizedBox(height: 25.h,),
                        Text("1",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                        SizedBox(height: 25.h,),
                        Text("1",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
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
