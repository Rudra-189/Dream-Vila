import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/productDataModel.dart';
import 'package:dreamvila/models/signUpModel.dart';
import 'package:dreamvila/models/userModel.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable{

  final status homeStatus;
  final String errorMessage;
  final PropertyResponse? data;
  final UserModel? user;

  const HomeState({this.homeStatus = status.init,  this.errorMessage = '',  this.data,this.user});

  HomeState copyWith({
    status? homeStatus,
    String? errorMessage,
    PropertyResponse? data,
    UserModel? user
}){
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      user: user ?? this.user
    );
  }

  @override
  List<Object?>get props => [homeStatus,errorMessage,data,user];
}

