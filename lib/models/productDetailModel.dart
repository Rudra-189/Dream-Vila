class ProductDetailModel {
  final String id;
  final String title;
  final String description;
  final String address;
  final int price;
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

  ProductDetailModel({
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

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      price: json['price'] ?? 0,
      discountPercentage: (json['discountPercentage'] as num).toDouble() ?? 0.0,
      rating: (json['rating'] as num).toDouble() ?? 0.0,
      plot: json['plot'] ?? 0,
      type: json['type'] ?? 0,
      bedroom: json['bedroom'] ?? 0,
      hall: json['hall'] ?? 0,
      kitchen: json['kitchen'] ?? 0,
      washroom: json['washroom'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images']) ?? [],
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
