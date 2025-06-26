import 'dart:developer';
import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/models/property_model/addProductResponseDataModel.dart';
import 'package:dreamvila/models/property_model/deleteProductDataModel.dart';
import 'package:dreamvila/models/property_model/productDataModel.dart';
import 'package:dreamvila/models/property_model/productDetailModel.dart';

import '../core/api_config/client/api_client.dart';


class ProductRepository{
  final ApiClient apiClint;

  ProductRepository(this.apiClint);

  Future<PropertyModel>getPropertyData()async{
    try{
      final response = await apiClint.request(RequestType.GET, ApiEndPoint.productUrl,);
      return PropertyModel.fromJson(response);
    }catch(e){
      log(e.toString());
      rethrow;
    }

  }

  Future<ProductDetailModel>getPropertyDetail(String id)async{
    try {
      final response = await apiClint.request(RequestType.GET, '${ApiEndPoint.productDetailUrl}/$id');
      return ProductDetailModel.fromJson(response["data"]);
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  Future<AddProductResponseModel>addProduct(Map<String,dynamic> product)async{
    try{
      final response = await apiClint
          .request(RequestType.POST, ApiEndPoint.addProductUrl, data: product);
      return AddProductResponseModel.fromJson(response);
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  Future<AddProductResponseModel>updateProduct(Map<String,dynamic> product,String id)async{
    try{
      final response = await apiClint.request(
          RequestType.PUT, '${ApiEndPoint.updateProductUrl}/$id',
          data: product);
      return AddProductResponseModel.fromJson(response);
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  Future<DeleteProductResponseModel>deleteProduct(String id)async{
    try{
      final response = await apiClint.request(
          RequestType.DELETE, '${ApiEndPoint.deleteProductUrl}/$id');
      return DeleteProductResponseModel.fromJson(response);
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }
}