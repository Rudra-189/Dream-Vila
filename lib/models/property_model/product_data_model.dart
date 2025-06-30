class PropertyModel {
  final bool status;
  final String message;
  final int page;
  final int limit;
  final int? prePage;
  final int? nextPage;
  final int total;
  final int totalPages;
  final List<Property> data;

  PropertyModel({
    required this.status,
    required this.message,
    required this.page,
    required this.limit,
    this.prePage,
    this.nextPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      status: json['status'],
      message: json['message'],
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      prePage: json['pre_page'] ?? 0,
      nextPage: json['next_page'] ?? 0,
      total: json['total'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
      data: List<Property>.from(json['data'].map((x) => Property.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "page": page,
        "limit": limit,
        "pre_page": prePage,
        "next_page": nextPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Property {
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
  final int v;

  Property({
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

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json['_id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        address: json['address'] ?? '',
        price: json['price'].toDouble() ?? 0,
        discountPercentage: json['discountPercentage'].toDouble() ?? 0,
        rating: json['rating'].toDouble() ?? 0,
        plot: json['plot'] ?? 0,
        type: json['type'] ?? '',
        bedroom: json['bedroom'] ?? 0,
        hall: json['hall'] ?? 0,
        kitchen: json['kitchen'] ?? 0,
        washroom: json['washroom'] ?? 0,
        thumbnail: json['thumbnail'] ?? '',
        images: List<String>.from(json['images']),
        userId: json['userId'] ?? '',
        v: json['__v'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "address": address,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "plot": plot,
        "type": type,
        "bedroom": bedroom,
        "hall": hall,
        "kitchen": kitchen,
        "washroom": washroom,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images),
        "userId": userId,
        "__v": v,
      };
}
