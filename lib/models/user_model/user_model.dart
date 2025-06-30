class UserProfileResponse {
  final bool status;
  final String message;
  final UserData? data;

  UserProfileResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

class UserData {
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? mobile;
  final int? gender;
  final String? image;
  final String? password;
  final String? hobby;

  UserData({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.gender,
    this.image,
    this.password,
    this.hobby,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      hobby: json['hobby'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'mobile': mobile,
        'gender': gender,
        'image': image,
        'password': password,
        'hobby': hobby,
      };
}
