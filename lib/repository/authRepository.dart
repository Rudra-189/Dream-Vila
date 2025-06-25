import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/api_config/endpoints/api_endpoint.dart';
import 'package:dreamvila/models/signUpModel.dart';
import 'package:dreamvila/models/signupResponseDataModel.dart';
import '../models/loginResponseDataModel.dart';


class AuthRepository{

  final ApiClient apiClint;

  AuthRepository(this.apiClint);

  Future<SignUpResponseModel> userSignup (SignupModel data)async{
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
    final response = await apiClint.request(
        RequestType.MULTIPART_POST, ApiEndPoint.signUpUser,multipartData: formData);

    return SignUpResponseModel.fromJson(response);
  }

  Future<LoginResponseMode> userLogin (Map<String,dynamic> data)async{
    final response = await apiClint.request(RequestType.POST,ApiEndPoint.signInUser,data: data);
    return LoginResponseMode.fromJson(response);
  }
}