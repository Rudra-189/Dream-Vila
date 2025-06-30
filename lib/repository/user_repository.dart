import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/core/utils/logger.dart';
import 'package:dreamvila/models/user_model/user_model.dart';

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
      Logger.lOG(e.toString());
      // log(e.toString());
      rethrow;
    }
  }
}