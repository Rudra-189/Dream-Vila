import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'dart:developer';
import 'package:dreamvila/models/auth_model/signupResponseDataModel.dart';
import '../models/auth_model/loginResponseDataModel.dart';


class AuthRepository{

  final ApiClient apiClint;

  AuthRepository(this.apiClint);

  Future<SignUpResponseModel> userSignup (Map<String,dynamic> data)async{
    try{
      final response = await apiClint.request(
          RequestType.MULTIPART_POST, ApiEndPoint.signUpUser,multipartData: data);

      return SignUpResponseModel.fromJson(response);
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  Future<LoginResponseMode> userLogin (Map<String,dynamic> data)async{
    try{
      final response = await apiClint
          .request(RequestType.POST, ApiEndPoint.signInUser, data: data);
      return LoginResponseMode.fromJson(response);
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }
}