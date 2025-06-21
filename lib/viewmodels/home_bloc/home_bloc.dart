import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/productDataModel.dart';
import 'package:dreamvila/models/signUpModel.dart';
import 'package:dreamvila/models/userModel.dart';
import 'package:dreamvila/repository/productRepository.dart';
import 'package:dreamvila/repository/userRepository.dart';
import 'package:meta/meta.dart';

import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final productRepository = ProductRepository(ApiClient());
  final userRepository = UserRepository(ApiClient());

  HomeBloc() : super(HomeState(index: 0)) {
    on<LoadHomePageDataEvent>(_loadHomePageDataEvent);
    on<OnTabIndexChangeEvent>(_onTabIndexChangeEvent);
  }

  void _loadHomePageDataEvent(LoadHomePageDataEvent event,Emitter emit)async{
    emit(state.copyWith(homeStatus: status.loading));
    final PropertyResponse data = await productRepository.getPropertyData();
    final UserModel user = await userRepository.getUserData();
    print(data.status);
    if(data.status == true && user != null){
      emit(state.copyWith(homeStatus: status.success,data: data,user: user));
    }else{
      emit(state.copyWith(homeStatus: status.failure,errorMessage: data.message));
    }
  }

  void _onTabIndexChangeEvent(OnTabIndexChangeEvent event,Emitter emit){
    emit(state.copyWith(index: event.index));
  }
}
