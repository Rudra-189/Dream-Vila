import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/models/property_model/add_product_model.dart';
import 'package:dreamvila/models/property_model/product_data_model.dart';
import 'package:equatable/equatable.dart';

abstract class AddProductEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class AddImagesEvent extends AddProductEvent{}

class OnProductAddButtonSubmitEvent extends AddProductEvent{
  final AddProductModel product;

  OnProductAddButtonSubmitEvent(this.product);
  @override
  List<Object>get props => [product];
}

class OnCancelImageEvent extends AddProductEvent{
  final int index;
  OnCancelImageEvent(this.index);
}

class OnDropDownValueChange extends AddImagesEvent{
  final String item;

  OnDropDownValueChange(this.item);
  @override
  List<Object>get props => [item];
}

class InitializeProductEvent extends AddProductEvent {
  final Property product;
  InitializeProductEvent(this.product);
}

class OnUpdateProductEvent extends AddProductEvent{
  final AddProductModel product;
  final String id;

  OnUpdateProductEvent(this.product,this.id);
  @override
  List<Object>get props => [product,id];
}

class OnDisposeEvent extends AddProductEvent{}