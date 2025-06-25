import 'package:equatable/equatable.dart';

class AddProductModel extends Equatable {
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

  const AddProductModel({
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
    this.images = const [],
  });

  Map<String, dynamic> toJson() {
    return {
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
    };
  }

  @override
  List<Object?> get props => [
    title,
    description,
    address,
    price,
    discountPercentage,
    rating,
    plot,
    type,
    bedroom,
    hall,
    kitchen,
    washroom,
    thumbnail,
    images,
  ];
}
