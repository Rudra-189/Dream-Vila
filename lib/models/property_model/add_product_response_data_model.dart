class AddProductResponseModel {
  final bool status;
  final String message;
  final ProductData data;

  AddProductResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddProductResponseModel.fromJson(Map<String, dynamic> json) {
    return AddProductResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: ProductData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProductData {
  final String id;
  final String title;
  final String description;
  final String address;
  final double price;
  final double discountPercentage;
  final double rating;
  final int plot;
  final String type;
  final int bedroom;
  final int hall;
  final int kitchen;
  final int washroom;
  final String thumbnail;
  final List<String> images;
  final String userId;

  ProductData({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.plot,
    required this.type,
    required this.bedroom,
    required this.hall,
    required this.kitchen,
    required this.washroom,
    required this.thumbnail,
    required this.images,
    required this.userId,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      plot: json['plot'] ?? 0,
      type: json['type'] ?? '',
      bedroom: json['bedroom'] ?? 0,
      hall: json['hall'] ?? 0,
      kitchen: json['kitchen'] ?? 0,
      washroom: json['washroom'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      images: (json['images'] is List)
          ? List<String>.from(json['images'])
          : (json['images'] is String)
          ? [json['images']]
          : [],
      userId: json['userId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'address': address,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'plot': plot,
      'type': type,
      'bedroom': bedroom,
      'hall': hall,
      'kitchen': kitchen,
      'washroom': washroom,
      'thumbnail': thumbnail,
      'images': images,
      'userId': userId,
    };
  }
}
