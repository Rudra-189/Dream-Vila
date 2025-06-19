
class ApiEndPoint {

  static String get baseUrl => 'https://interview.flexioninfotech.com';

  static String get signUpUser => '$baseUrl/public/auth/register';
  static String get signInUser => '$baseUrl/public/auth/login';
  static String get productUrl=> '$baseUrl/private/products/all-product';
}
