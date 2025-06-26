
import 'package:equatable/equatable.dart';

import '../../core/utils/exports.dart';
import '../../core/utils/status.dart';

class AddProductState extends Equatable {

  final bool isInitialized;
  final status addProductStatus;
  final String errorMessage;
  final String? thumbnail;
  final List<String>? images;

  // UI Elements (Not recommended in state)
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController addressController;
  final TextEditingController priceController;
  final TextEditingController discountPercentageController;
  final TextEditingController ratingController;
  final TextEditingController plotController;
  final TextEditingController typeController;
  final TextEditingController bedroomController;
  final TextEditingController hallController;
  final TextEditingController kitchenController;
  final TextEditingController washroomController;

   AddProductState({
     this.isInitialized = false,
     required this.formKey,
    this.addProductStatus = status.init,
    this.errorMessage = '',
    this.thumbnail,
    this.images = const [],
    required this.titleController,
    required this.descriptionController,
    required this.addressController,
    required this.priceController,
    required this.discountPercentageController,
    required this.ratingController,
    required this.plotController,
    required this.typeController,
    required this.bedroomController,
    required this.hallController,
    required this.kitchenController,
    required this.washroomController,
  });

  // Factory constructor to create initial state
  factory AddProductState.initial() {
    return AddProductState(
      formKey: GlobalKey<FormState>(),
      titleController: TextEditingController(),
      descriptionController: TextEditingController(),
      addressController: TextEditingController(),
      priceController: TextEditingController(),
      discountPercentageController: TextEditingController(),
      ratingController: TextEditingController(),
      plotController: TextEditingController(),
      typeController: TextEditingController(),
      bedroomController: TextEditingController(),
      hallController: TextEditingController(),
      kitchenController: TextEditingController(),
      washroomController: TextEditingController(),
    );
  }



  AddProductState copyWith({
    bool? isInitialized,
    status? addProductStatus,
    String? errorMessage,
    String? thumbnail,
    List<String>? images,
    TextEditingController? titleController,
    TextEditingController? descriptionController,
    TextEditingController? addressController,
    TextEditingController? priceController,
    TextEditingController? discountPercentageController,
    TextEditingController? ratingController,
    TextEditingController? plotController,
    TextEditingController? typeController,
    TextEditingController? bedroomController,
    TextEditingController? hallController,
    TextEditingController? kitchenController,
    TextEditingController? washroomController,
  }) {
    return AddProductState(
      formKey: formKey,
      isInitialized: isInitialized ?? this.isInitialized,
      addProductStatus: addProductStatus ?? this.addProductStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
      titleController: titleController ?? this.titleController,
      descriptionController: descriptionController ?? this.descriptionController,
      addressController: addressController ?? this.addressController,
      priceController: priceController ?? this.priceController,
      discountPercentageController: discountPercentageController ?? this.discountPercentageController,
      ratingController: ratingController ?? this.ratingController,
      plotController: plotController ?? this.plotController,
      typeController: typeController ?? this.typeController,
      bedroomController: bedroomController ?? this.bedroomController,
      hallController: hallController ?? this.hallController,
      kitchenController: kitchenController ?? this.kitchenController,
      washroomController: washroomController ?? this.washroomController,
    );
  }

  @override
  List<Object?> get props => [
    isInitialized,
    addProductStatus,
    errorMessage,
    thumbnail,
    images,
    formKey,
    titleController,
    descriptionController,
    addressController,
    priceController,
    discountPercentageController,
    ratingController,
    plotController,
    typeController,
    bedroomController,
    hallController,
    kitchenController,
    washroomController,
  ];
}

extension AddProductStateExtension on AddProductState {
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    priceController.dispose();
    discountPercentageController.dispose();
    ratingController.dispose();
    plotController.dispose();
    typeController.dispose();
    bedroomController.dispose();
    hallController.dispose();
    kitchenController.dispose();
    washroomController.dispose();
  }
}

