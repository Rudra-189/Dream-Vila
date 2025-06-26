class ProductResponse {
  final bool status;
  final String message;
  final ProductData? data;

  ProductResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };
}

class ProductData {
  final String id;
  final String title;
  final String description;
  final String address;
  final int price;
  final int discountPercentage;
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
  final int v;

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
    required this.v,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      price: json['price'] ?? 0,
      discountPercentage: json['discountPercentage'],
      rating: (json['rating'] != null) ? json['rating'].toDouble() : null,
      plot: json['plot'] ?? 0,
      type: json['type'] ?? '',
      bedroom: json['bedroom'] ?? 0,
      hall: json['hall'] ?? '',
      kitchen: json['kitchen'] ?? '',
      washroom: json['washroom'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      images: json['images'] != null ? List<String>.from(json['images']): [] ,
      userId: json['userId'] ?? '',
      v: json['__v'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
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
    '__v': v,
  };
}
