import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/property_model/product_data_model.dart';
import 'package:dreamvila/models/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int index;
  final Status homestatus;
  final Status productstatus;
  final PropertyModel? data;
  // final List<Property> filteredProperties;
  final UserProfileResponse? user;
  final String errorMessage;

  const HomeState({
    this.index = 0,
    this.homestatus = Status.init,
    this.productstatus = Status.init,
    this.data,
    this.user,
    // this.filteredProperties = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    int? index,
    Status? homestatus,
    Status? productstatus,
    PropertyModel? data,
    UserProfileResponse? user,
    String? errorMessage,
    // List<Property>? filteredProperties
  }) {
    return HomeState(
      index: index ?? this.index,
      homestatus: homestatus ?? this.homestatus,
      productstatus: productstatus ?? this.productstatus,
      data: data ?? this.data,
      user: user ?? this.user,
      // filteredProperties: filteredProperties ?? this.filteredProperties,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [homestatus, errorMessage, data, user, index];
}
