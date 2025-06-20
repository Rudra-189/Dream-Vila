class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final int mobile;
  final int gender;
  final String image;
  final String password;
  final String hobby;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.image,
    required this.password,
    required this.hobby,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? 0,
      gender: json['gender'] ?? 0,
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      hobby: json['hobby'] ?? '',
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
    };
  }
}
