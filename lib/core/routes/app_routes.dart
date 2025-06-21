import 'package:dreamvila/core/utils/exports.dart';

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
