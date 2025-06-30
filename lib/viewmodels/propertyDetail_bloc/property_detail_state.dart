import 'package:dreamvila/models/property_model/product_detail_model.dart';
import 'package:equatable/equatable.dart';

import '../../core/utils/status.dart';

class PropertyDetailState extends Equatable {
  final Status detailPagestatus;
  final String errorMessage;
  final ProductResponse? data;
  final int currentIndex;

  const PropertyDetailState(
      {this.detailPagestatus = Status.init,
      this.errorMessage = '',
      this.data,
      required this.currentIndex});

  PropertyDetailState copyWith({
    Status? detailPagestatus,
    String? errorMessage,
    ProductResponse? data,
    int? currentIndex,
  }) {
    return PropertyDetailState(
        detailPagestatus: detailPagestatus ?? this.detailPagestatus,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
        currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props =>
      [detailPagestatus, errorMessage, data, currentIndex];
}
