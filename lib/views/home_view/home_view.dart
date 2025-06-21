import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

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
                      _buildPropertyList(context,data!,state)
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
              height: 75.h,
              width: 75.h,
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
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: Theme.of(context).textTheme.titleLarge,
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
              style: Theme.of(context).textTheme.titleMedium,
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
                  style: Theme.of(context).textTheme.displayMedium,
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
      context.read<HomeBloc>().add(OnTabIndexChangeEvent(value));
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

Widget _buildPropertyList(BuildContext context,PropertyResponse data,HomeState state) {

  final categoryFilter = ['house', 'apartment', 'office', 'land'];

  final filteredData = data.data.where((e) => e.type == categoryFilter [state.index]).toList();

  return Expanded(
    child: ListView.builder(
      itemBuilder: (context, index) {
        final property = filteredData[index];
        if(filteredData.isEmpty){
          return Text("Data Not Found!",style: Theme.of(context).textTheme.bodyLarge,);
        }else{
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
                    CustomImageView(imagePath: property.thumbnail,height: 85.h,width: 85.h,radius: BorderRadius.circular(10)),
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
                              Expanded(
                                child: Text(property.title,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(overflow: TextOverflow.ellipsis)),
                              ),
                              Text(
                                "\$ ${property.price.toString()}",
                                style: Theme.of(context).textTheme.displayMedium,
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
                              Expanded(
                                child: Text(property.address,
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12,overflow: TextOverflow.ellipsis)),
                              ),
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
        }
      },
      itemCount:filteredData.length,
    ),
  );
}
