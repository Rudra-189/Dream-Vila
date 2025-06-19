import 'package:dio/dio.dart';
import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';

import '../core/api_config/client/api_client.dart';

class HomeRepository{
  final ApiClient apiClint;

  HomeRepository(this.apiClint);

  Future<void>getPropertyData()async{
    final response = await apiClint.request(RequestType.GET, ApiEndPoint.productUrl,);
    print(response);
  }
}