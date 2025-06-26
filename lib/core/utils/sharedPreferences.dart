import 'dart:convert';

import 'package:dreamvila/models/auth_model/signupResponseDataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{

  Future<void> storeUserIsLogin(bool isLogin)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLogin", isLogin);
  }

  Future<bool> getUserIsLogin()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogin") ?? false;
  }

  Future<void> saveUserData(UserData user) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('userData', userJson);
  }

  Future<UserData?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('userData');

    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserData.fromJson(userMap);
    }
    return null;
  }

}