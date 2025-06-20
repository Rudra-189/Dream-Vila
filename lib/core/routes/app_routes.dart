import 'package:dreamvila/views/addProduct_view/addProduct_view.dart';
import 'package:dreamvila/views/home_view/home_view.dart';
import 'package:dreamvila/views/propertyDetail_view/propertyDetail_view.dart';
import 'package:dreamvila/views/signin_view/signin_view.dart';
import 'package:dreamvila/views/signup_view/signup_view.dart';
import 'package:dreamvila/views/splash_view/splash_view.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String signInScreen = '/signInScreen';
  static const String signupScreen = '/signupScreen';
  static const String homeScreen = '/homeScreen';
  static const String propertyDetailScreen = '/propertyDetailScreen';
  static const String addProductScreen = '/addProductScreen';

  static Map<String, WidgetBuilder> get routes => {
    initialRoute : (context) => SplashView(),
    signInScreen : (context) => SignInView(),
    signupScreen : (context) => SignUpView(),
    homeScreen : (context) => HomeView(),
    propertyDetailScreen : (context) {
      final arg = ModalRoute.of(context)!.settings.arguments;
      final id = (arg is String) ? arg : '';
      return PropertyDetailView(id: id,);
      },
    addProductScreen : (context) => AddProductView(),
  };
}
