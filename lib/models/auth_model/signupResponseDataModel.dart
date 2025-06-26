class SignUpResponseModel {
  final bool status;
  final String message;
  final UserData? data;

  SignUpResponseModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  final String firstName;
  final String lastName;
  final String email;
  final int mobile;
  final int gender;
  final String image;
  final String password;
  final String hobby;
  final String id;
  final int v;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.image,
    required this.password,
    required this.hobby,
    required this.id,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? 0,
      gender: json['gender'] ?? 0,
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      hobby: json['hobby'] ?? '',
      id: json['_id'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'image': image,
      'password': password,
      'hobby': hobby,
      '_id': id,
      '__v': v,
    };
  }
}
