import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/property_model/productDataModel.dart';
import 'package:dreamvila/models/user_model/userModel.dart';
import 'package:dreamvila/repository/product_repository.dart';
import 'package:dreamvila/repository/user_repository.dart';

import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final productRepository = ProductRepository(ApiClient());
  final userRepository = UserRepository(ApiClient());

  HomeBloc() : super(HomeState(index: 0)) {
    on<LoadHomePageDataEvent>(_loadHomePageDataEvent);
    on<OnTabIndexChangeEvent>(_onTabIndexChangeEvent);
    on<OnProductDelete>(_onProductDelete);
  }

  void _loadHomePageDataEvent(LoadHomePageDataEvent event,Emitter emit)async{
    emit(state.copyWith(homeStatus: status.loading));
    final PropertyModel data = await productRepository.getPropertyData();
    final UserProfileResponse user = await userRepository.getUserData();
    print(data.status);
    if(data.status == true && user != null){
      emit(state.copyWith(homeStatus: status.success,productStatus: status.success,data: data,user: user));
    }else{
      emit(state.copyWith(homeStatus: status.failure,errorMessage: data.message));
    }
  }

  void _onTabIndexChangeEvent(OnTabIndexChangeEvent event,Emitter emit){
    final categoryFilter = ['house', 'apartment', 'office', 'land'];
    // final filteredData = state.data!.data.where((e) => e.type == categoryFilter [state.index]).toList();
    // print(filteredData.length);
    emit(state.copyWith(index: event.index));
  }

  void _onProductDelete(OnProductDelete event,Emitter emit)async{
    emit(state.copyWith(productStatus:  status.loading));
    final result = await productRepository.deleteProduct(event.id);
    if(result.status == true){
      final PropertyModel data = await productRepository.getPropertyData();
      if(data.status == true ){
        emit(state.copyWith(productStatus: status.success,data: data));
      }else{
        emit(state.copyWith(productStatus: status.failure,errorMessage: data.message));
      }
    }else{
      emit(state.copyWith(productStatus: status.failure,errorMessage: 'error'));
    }
  }
}
