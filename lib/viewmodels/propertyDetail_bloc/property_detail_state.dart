import 'package:dreamvila/models/productDetailModel.dart';
import 'package:equatable/equatable.dart';

import '../../core/utils/status.dart';

class PropertyDetailState extends Equatable{
  final status detailPageStatus;
  final String errorMessage;
  final ProductModel? data;
  final int currentIndex;

  const PropertyDetailState({this.detailPageStatus = status.init,  this.errorMessage = '',  this.data,required this.currentIndex});

  PropertyDetailState copyWith({
    status? detailPageStatus,
    String? errorMessage,
    ProductModel? data,
    int? currentIndex,
  }){
    return PropertyDetailState(
        detailPageStatus: detailPageStatus ?? this.detailPageStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
        currentIndex: currentIndex ?? this.currentIndex
    );
  }

  @override
  List<Object?>get props => [detailPageStatus,errorMessage,data,currentIndex];
}

