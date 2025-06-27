import 'package:dreamvila/models/property_model/product_data_model.dart';
import 'package:equatable/equatable.dart';

abstract class AddProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddImagesEvent extends AddProductEvent {}
class CancelImageEvent extends AddProductEvent {
  final int index;
  CancelImageEvent(this.index);
  @override
  List<Object> get props => [index];
}
class InitializeProductEvent extends AddProductEvent {
  final Property product;
  InitializeProductEvent(this.product);
  @override
  List<Object> get props => [product];
}
class DropDownChangedEvent extends AddProductEvent {
  final String type;
  DropDownChangedEvent(this.type);
  @override
  List<Object> get props => [type];
}
class SubmitProductEvent extends AddProductEvent {
  final bool isUpdate;
  final String? id;
  SubmitProductEvent(this.isUpdate, {this.id});
  @override
  List<Object?> get props => [isUpdate, id];
}
class DisposeEvent extends AddProductEvent {}
