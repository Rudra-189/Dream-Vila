import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/models/addProductModel.dart';
import 'package:dreamvila/models/productDataModel.dart';

import '../core/api_config/client/api_client.dart';
import '../models/productDetailModel.dart';

class ProductRepository{
  final ApiClient apiClint;

  ProductRepository(this.apiClint);

  Future<PropertyResponse>getPropertyData()async{
    final response = await apiClint.request(RequestType.GET, ApiEndPoint.productUrl,);

    if(response['status'] == true){
      return PropertyResponse.fromJson(response);
    }else{
      throw Exception('Failed to load properties: ${response['status']}');
    }
  }

  Future<ProductModel>getPropertyDetail(String id)async{
    final response = await apiClint.request(RequestType.GET,'${ApiEndPoint.productDetailUrl}/$id');
    if(response['status'] == true){
      return ProductModel.fromJson(response["data"]);
    }else{
      throw Exception('Failed to load properties: ${response['status']}');
    }
  }

  Future<bool>addProduct(AddProductModel product)async{
    Map<String,dynamic> data = {
        'title': product.title,
        'description': product.description,
        'address': product.address,
        'price': product.price,
        'discountPercentage': product.discountPercentage,
        'rating': product.rating,
        'plot': product.plot,
        'type': product.type,
        'bedroom': product.bedroom,
        'hall': product.hall,
        'kitchen': product.kitchen,
        'washroom': product.washroom,
        'thumbnail': product.thumbnail,
        'images': product.images
    };
    final response = await apiClint.request(RequestType.POST,ApiEndPoint.addProductUrl,data:data);
    print(response);
    if(response['status'] == true){
      return true;
    }else{
      return false;
    }
  }
}