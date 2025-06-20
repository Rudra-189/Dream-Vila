import 'package:dreamvila/models/addProductModel.dart';
import 'package:equatable/equatable.dart';

abstract class AddProductEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class AddThumbnailEvent extends AddProductEvent{}

class AddImagesEvent extends AddProductEvent{}

class OnProductAddButtonSubmitEvent extends AddProductEvent{
  final AddProductModel product;

  OnProductAddButtonSubmitEvent(this.product);
  @override
  List<Object>get props => [product];
}
