class LoginResponseMode{
  final bool status;
  final String message;
  final String? token;

  LoginResponseMode({required this.status, required this.message, required this.token});

  factory LoginResponseMode.fromJson(Map<String,dynamic> data){
    return LoginResponseMode(
      status: data['status'],
      message: data['message'] ?? '',
      token: data['token'] ?? ''
    );
  }
}