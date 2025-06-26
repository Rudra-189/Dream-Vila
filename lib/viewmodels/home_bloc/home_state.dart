import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/property_model/product_data_model.dart';
import 'package:dreamvila/models/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable{

  final int index;
  final status homeStatus;
  final status productStatus;
  final PropertyModel? data;
  // final List<Property> filteredProperties;
  final UserProfileResponse? user;
  final String errorMessage;

  HomeState({
    this.index = 0,
    this.homeStatus = status.init,
    this.productStatus = status.init,
    this.data,
    this.user,
    // this.filteredProperties = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    int? index,
    status? homeStatus,
    status? productStatus,
    PropertyModel? data,
    UserProfileResponse? user,
    String? errorMessage,
    // List<Property>? filteredProperties
  }) {
    return HomeState(
      index: index ?? this.index,
      homeStatus: homeStatus ?? this.homeStatus,
      productStatus: productStatus ?? this.productStatus,
      data: data ?? this.data,
      user: user ?? this.user,
      // filteredProperties: filteredProperties ?? this.filteredProperties,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?>get props => [homeStatus,errorMessage,data,user,index];
}

