import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/views/add_product_view/page/add_product_view.dart';
import 'package:dreamvila/views/property_detail_view/page/property_detail_view.dart';
import 'package:dreamvila/views/setting_view/page/setting_view.dart';
import 'package:dreamvila/views/user_profile_view/user_profile_view.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String signInScreen = '/signInScreen';
  static const String signupScreen = '/signupScreen';
  static const String homeScreen = '/homeScreen';
  static const String propertyDetailScreen = '/propertyDetailScreen';
  static const String addProductScreen = '/addProductScreen';
  static const String settingScreen = '/settingScreen';
  static const String userProfileScreen = '/userProfileScreen';

  static Map<String, WidgetBuilder> get routes => {
    initialRoute : SplashView.builder,
    signInScreen : SignInView.builder,
    signupScreen : SignUpView.builder,
    homeScreen : HomeView.builder,
    propertyDetailScreen : (BuildContext context) {
      final arg = ModalRoute.of(context)!.settings.arguments;
      final id = (arg is String) ? arg : '';
      return PropertyDetailView(id: id,);
      },
    addProductScreen : (BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments;
      final data = args is Map<String, dynamic> ? args : {};
      return AddOrUpdateProductScreen(
        isUpdate: data['isUpdate'] ?? false,
        product: data['data'],
      );
    },
    settingScreen : SettingView.builder,
    userProfileScreen : UserProfileView.builder
  };
}
