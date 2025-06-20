import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/models/signUpModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepository{

  final ApiClient apiClint;

  AuthRepository(this.apiClint);

  final storage = FlutterSecureStorage();


  Future<bool> userSignup (SignupModel data)async{
    Map<String,dynamic> formData = {
      'image': [data.image!.path],
      'firstName': data.firstName,
      'lastName': data.lastName,
      'gender': data.gender.toString(),
      'hobby': data.hobbies,
      'email': data.email,
      'mobile': data.mobile.toString(),
      'password': data.password
    };

    try {
      final response = await apiClint.request(
          RequestType.MULTIPART_POST, ApiEndPoint.signUpUser,multipartData: formData);
      if (response['status'] == true && response["data"] != null) {
        print("true");
        return true;
      }else{
        return false;
      }
    }catch(e){
      rethrow;
    }
  }

  Future<bool> userLogin (Map<String,dynamic> data)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await apiClint.request(RequestType.POST,ApiEndPoint.signInUser,data: data);

    if(response['status'] == true){
      await storage.write(key: "deviceToken", value: response['token']);
      await prefs.setBool('isLogin', true);
      return true;
    }else{
      return false;
    }
  }
}