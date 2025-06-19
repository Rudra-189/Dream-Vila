import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/routes/app_routes.dart';
import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:dreamvila/repository/homeRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});

  final List<Map<String, dynamic>> properties = [
    {
      "title": "Dup Apartment",
      "location": "2BW Street, NY, New York",
      "discount": "20 %",
      "price": "\$267000",
      "rating": "4.5",
      "image": "https://via.placeholder.com/150"
    },
    {
      "title": "Dup Apartment",
      "location": "2BW Street, NY, New York",
      "discount": "15 %",
      "price": "\$510000",
      "rating": "4.8",
      "image": "https://via.placeholder.com/150/0000FF/808080"
    }
    // Add more...
  ];

  @override
  Widget build(BuildContext context) {
    HomeRepository(ApiClient()).getPropertyData();
    print("build");
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                _buildUserInfo(context),
                _buildTabView(context),
                SizedBox(height: 10.h,),
                _buildPropertyList(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildUserInfo(BuildContext context){
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
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10.r),
                border: Border(
                  top: BorderSide(color: Theme.of(context).customColors.secondaryColor,width: 1.w),
                  bottom: BorderSide(color: Theme.of(context).customColors.secondaryColor,width: 1.w),
                  left: BorderSide(color: Theme.of(context).customColors.secondaryColor,width: 1.w),
                  right: BorderSide(color: Theme.of(context).customColors.secondaryColor,width: 1.w),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).customColors.borderColor,
                    offset: Offset(2, 2),
                    blurRadius: 10
                  )
                ]
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Hello!",style: MyAppThemeHelper.lightTheme.textTheme.titleLarge,),
                Text("Mr. Smith",style: MyAppThemeHelper.lightTheme.textTheme.titleLarge,),
              ],
            )
          ],
        ),
        SizedBox(height: 15.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("mr.smith123@gmail.com",style: MyAppThemeHelper.lightTheme.textTheme.titleMedium,),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border(
                  top: BorderSide(color: Theme.of(context).customColors.primaryColor.withOpacity(0.25),width: 1.w),
                  bottom: BorderSide(color: Theme.of(context).customColors.primaryColor.withOpacity(0.25),width: 1.w),
                  left: BorderSide(color: Theme.of(context).customColors.primaryColor.withOpacity(0.25),width: 1.w),
                  right: BorderSide(color: Theme.of(context).customColors.primaryColor.withOpacity(0.25),width: 1.w),
                ),
              ),
              alignment: Alignment.center,
              child: Text("+Add Property",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
            )
          ],
        )
      ],
    ),
  );
}

Widget _buildTabView(BuildContext context){
  return TabBar(
    onTap:(int value){
      print(value);
    },
    labelColor: Theme.of(context).customColors.primaryColor,
    unselectedLabelColor: Colors.black54,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
    labelPadding: EdgeInsets.all(0.r),
    indicator: ShapeDecoration(
        color:Theme.of(context).customColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        shadows: [
          BoxShadow(
              color: Theme.of(context).customColors.borderColor,
              offset: Offset(-1, 1),
              blurRadius: 5.r
          )
        ]
    ),
    tabs: [
      Tab(text: 'House'),
      Tab(text: 'Apartment'),
      Tab(text: 'Office'),
      Tab(text: 'Land'),
    ],
  );
}

Widget _buildPropertyList(BuildContext context){
  return Expanded(
    child: ListView.builder(
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(AppRoutes.propertyDetailScreen);
          },
          child: Card(
            color: Colors.white,
            shadowColor: Theme.of(context).customColors.borderColor,
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 84,
                    width: 85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("property",style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                            Text("\$ 200000",style: MyAppThemeHelper.lightTheme.textTheme.displayMedium,),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Icon(Icons.location_pin,color : Colors.black54,size: 18.sp,),
                            Text("2BW Street, NY, New York",style: TextStyle(color: Colors.black54,fontSize: 12)),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Plots 1",style: TextStyle(color: Colors.black38,fontSize: 10),),
                            SizedBox(width: 5,),
                            Text("|",style: TextStyle(color: Theme.of(context).customColors.primaryColor),),
                            SizedBox(width: 5,),
                            Text("20 % Discount",style: TextStyle(color: Colors.black38,fontSize: 10),),
                            SizedBox(width: 5,),
                            Text("|",style: TextStyle(color: Theme.of(context).customColors.primaryColor),),
                            SizedBox(width: 5,),
                            Row(
                              children: [
                                Icon(Icons.star,color: Theme.of(context).customColors.primaryColor,size: 15,),
                                Text("4.5",style: TextStyle(color: Colors.black38,fontSize: 10),)
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
    ),
  );
}
