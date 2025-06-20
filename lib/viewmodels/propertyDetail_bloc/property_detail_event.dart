import 'package:equatable/equatable.dart';

abstract class PropertyDetailEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class LoadProductDetailEvent extends PropertyDetailEvent{
  final String id;

  LoadProductDetailEvent(this.id);

  @override
  List<Object>get props => [id];
}

class ChangeIndexEvent extends PropertyDetailEvent{
  final int index;
  ChangeIndexEvent(this.index);
}
