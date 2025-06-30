import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/views/home_view/widget/home_shimmer.dart';
import 'package:flutter/material.dart';

import '../widget/custompopup_menu.dart';

class HomeView extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const HomeView();
  }

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHomePageDataEvent());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.homestatus == Status.loading) {
              return HomeShimmer.buildHomePageSimmer(context);
            } else if (state.homestatus == Status.success) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      _buildUserInfo(context, state.user!),
                      _buildTabView(context),
                      SizedBox(
                        height: 10.h,
                      ),
                      _buildPropertyList(context, state)
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text(state.errorMessage));
            }
          },
        ),
      ),
    );
  }
}

Widget _buildUserInfo(BuildContext context, UserProfileResponse user) {
  return SizedBox(
    height: 150.h,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //user Image
            GestureDetector(
              onTap: () {
                NavigatorService.pushNamed(AppRoutes.userProfileScreen);
              },
              child: Container(
                height: 75.h,
                width: 75.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color: Theme.of(context).customColors.secondaryColor,
                        width: 3.w),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).customColors.borderColor,
                          offset: Offset(2, 2),
                          blurRadius: 10.r)
                    ]),
                child: CustomImageView(
                  imagePath: '${ApiEndPoint.userImageUrl}/${user.data?.image}',
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Lang.of(context).lbl_hello,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${user.data?.firstName} ${user.data?.lastName}",
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
              user.data!.email.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    color: Theme.of(context)
                        .customColors
                        .primaryColor
                        .withOpacity(0.25),
                    width: 1.w),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.addProductScreen, arguments: {
                    'isUpdate': false,
                    // 'data': null
                  });
                },
                child: Text(
                  Lang.of(context).lbl_add_product,
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
    unselectedLabelColor: Theme.of(context).customColors.iconColor,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
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
      Tab(text: Lang.of(context).lbl_house),
      Tab(text: Lang.of(context).lbl_apartment),
      Tab(text: Lang.of(context).lbl_office),
      Tab(text: Lang.of(context).lbl_land),
    ],
  );
}

Widget _buildPropertyList(BuildContext context, HomeState state) {
  final categoryFilter = ['house', 'apartment', 'office', 'land'];
  final filteredData = state.data!.data
      .where((e) => e.type == categoryFilter[state.index])
      .toList();

  return BlocBuilder<HomeBloc, HomeState>(
    buildWhen: (previous, current) =>
        previous.productstatus != current.productstatus ||
        previous.index != current.index,
    builder: (context, state) {
      if (state.productstatus == Status.loading) {
        return const Expanded(
            child: Center(child: CircularProgressIndicator()));
      } else if (state.productstatus == Status.success) {
        if (filteredData.isEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                Lang.of(context).lbl_no_data_found,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final property = filteredData[index];
              return GestureDetector(
                onTap: () {
                  NavigatorService.pushNamed(AppRoutes.propertyDetailScreen,
                      arguments: property.id);
                },
                onLongPressStart: (details) {
                  showContextMenu(
                      context, details.globalPosition, property.id, property);
                },
                child: Card(
                  color: Theme.of(context).customColors.secondaryColor,
                  shadowColor: Theme.of(context).customColors.borderColor,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: property.thumbnail,
                          height: 85.h,
                          width: 85.h,
                          radius: BorderRadius.circular(10),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(property.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                  ),
                                  Text(
                                    "\$ ${property.price.toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Icon(Icons.location_pin,
                                      color: Theme.of(context)
                                          .customColors
                                          .iconColor,
                                      size: 18.sp),
                                  Expanded(
                                    child: Text(property.address,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .customColors
                                              .iconColor,
                                          fontSize: 12,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${Lang.of(context).lbl_plots} ${property.plot.toString()}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .customColors
                                            .cardLowerTextColor,
                                        fontSize: 10),
                                  ),
                                  const SizedBox(width: 5),
                                  Text("|",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .customColors
                                              .primaryColor)),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${property.discountPercentage} ${Lang.of(context).lbl_discount}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .customColors
                                            .cardLowerTextColor,
                                        fontSize: 10),
                                  ),
                                  const SizedBox(width: 5),
                                  Text("|",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .customColors
                                              .primaryColor)),
                                  const SizedBox(width: 5),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Theme.of(context)
                                              .customColors
                                              .primaryColor,
                                          size: 15),
                                      Text(property.rating.toString(),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .customColors
                                                  .cardLowerTextColor,
                                              fontSize: 10)),
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
            itemCount: filteredData.length,
          ),
        );
      } else {
        return Expanded(child: Center(child: Text(state.errorMessage)));
      }
    },
  );
}
