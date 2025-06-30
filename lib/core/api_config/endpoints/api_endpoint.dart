
class ApiEndPoint {

  static String get baseUrl => 'https://interview.flexioninfotech.com';

  static String get signUpUser => '$baseUrl/public/auth/register';
  static String get signInUser => '$baseUrl/public/auth/login';
  static String get productUrl=> '$baseUrl/private/products/all-product';
  static String get productDetailUrl=> '$baseUrl/private/products/get-product';
  static String get addProductUrl=> '$baseUrl/private/products/create-product';
  static String get userDataUrl=> '$baseUrl/private/user/profile';
  static String get updateProductUrl=> '$baseUrl/private/products/product/';
  static String get deleteProductUrl=> '$baseUrl/private/products/product';
  static String get userImageUrl=> '$baseUrl/uploads';
}
