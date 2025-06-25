import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/models/userModel.dart';

import '../core/api_config/client/api_client.dart';

class UserRepository{
  final ApiClient apiClint;

  UserRepository(this.apiClint);

  Future<UserModel>getUserData()async{
    final response = await apiClint.request(RequestType.GET, ApiEndPoint.userDataUrl);
    return UserModel.fromJson(response["data"]);
  }
}