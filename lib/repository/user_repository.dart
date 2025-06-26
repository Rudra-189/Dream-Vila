import 'dart:developer';

import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/models/user_model/userModel.dart';

import '../core/api_config/client/api_client.dart';

class UserRepository{
  final ApiClient apiClint;

  UserRepository(this.apiClint);

  Future<UserProfileResponse>getUserData()async{
    try {
      final response =
          await apiClint.request(RequestType.GET, ApiEndPoint.userDataUrl);
      return UserProfileResponse.fromJson(response);
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }
}