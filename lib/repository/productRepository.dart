import 'package:dio/dio.dart';
import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/models/addProductModel.dart';
import 'package:dreamvila/models/addProductResponseDataModel.dart';
import 'package:dreamvila/models/deleteProductDataModel.dart';
import 'package:dreamvila/models/productDataModel.dart';

import '../core/api_config/client/api_client.dart';
import '../models/productDetailModel.dart';

class ProductRepository{
  final ApiClient apiClint;

  ProductRepository(this.apiClint);

  Future<PropertyModel>getPropertyData()async{
    final response = await apiClint.request(RequestType.GET, ApiEndPoint.productUrl,);
    return PropertyModel.fromJson(response);
  }

  Future<ProductDetailModel>getPropertyDetail(String id)async{
    final response = await apiClint.request(RequestType.GET,'${ApiEndPoint.productDetailUrl}/$id');
    if(response['status'] == true){
      return ProductDetailModel.fromJson(response["data"]);
    }else{
      throw Exception('Failed to load properties: ${response['status']}');
    }
  }

  Future<AddProductResponseModel>addProduct(AddProductModel product)async{
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
    return AddProductResponseModel.fromJson(response);
  }

  Future<AddProductResponseModel>updateProduct(AddProductModel product,String id)async{
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
      'images':product.images
    };
    final response = await apiClint.request(RequestType.PUT, '${ApiEndPoint.updateProductUrl}/$id',data: data);
    print(response);
    return AddProductResponseModel.fromJson(response);
  }

  Future<DeleteProductResponseModel>deleteProduct(String id)async{
    final response = await apiClint.request(RequestType.DELETE,'${ApiEndPoint.deleteProductUrl}/$id');
    return DeleteProductResponseModel.fromJson(response);
  }
}