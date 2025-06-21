import 'package:dreamvila/core/routes/app_routes.dart';
import 'package:dreamvila/core/themes/theme_helper.dart';
import 'package:dreamvila/core/utils/ImagePickerUtils.dart';
import 'package:dreamvila/viewmodels/addProduct_bloc/add_product_bloc.dart';
import 'package:dreamvila/viewmodels/home_bloc/home_bloc.dart';
import 'package:dreamvila/viewmodels/propertyDetail_bloc/property_detail_bloc.dart';
import 'package:dreamvila/viewmodels/signin_bloc/signin_bloc.dart';
import 'package:dreamvila/viewmodels/signup_bloc/signup_bloc.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_bloc.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>SplashBloc()..add(LoadSplashEvent())),
        BlocProvider(create: (_)=>SignupBloc(ImagePickerUtils())),
        BlocProvider(create: (_)=>SignInBloc()),
        BlocProvider(create: (_)=>HomeBloc()),
        BlocProvider(create: (_)=>PropertyDetailBloc()),
        BlocProvider(create: (_)=>AddProductBloc(ImagePickerUtils()))
      ],
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
        builder: (_,child){
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: MyAppThemeHelper.lightTheme,
            themeMode: ThemeMode.light,
            routes: AppRoutes.routes,
            initialRoute: AppRoutes.initialRoute,
          );
        },
      ),
    );
  }
}