class DeleteProductResponseModel {
  final bool status;
  final String message;

  DeleteProductResponseModel({
    required this.status,
    required this.message,
  });

  factory DeleteProductResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteProductResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
