import 'package:equatable/equatable.dart';

class AddProductModel extends Equatable {
  final String title;
  final String description;
  final String address;
  final double price;
  final int discountPercentage;
  final double rating;
  final int plot;
  final String type;
  final int bedroom;
  final int hall;
  final int kitchen;
  final int washroom;
  final String thumbnail; // Use File if you're uploading image
  final List<String>? images; // List of image files

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
    this.images,
  });

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
