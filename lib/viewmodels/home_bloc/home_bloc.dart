import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/property_model/product_data_model.dart';
import 'package:dreamvila/models/user_model/user_model.dart';
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

  void _loadHomePageDataEvent(LoadHomePageDataEvent event, Emitter emit) async {
    emit(state.copyWith(homestatus: Status.loading));
    final PropertyModel data = await productRepository.getPropertyData();
    final UserProfileResponse user = await userRepository.getUserData();
    if (data.status == true) {
      emit(state.copyWith(
          homestatus: Status.success,
          productstatus: Status.success,
          data: data,
          user: user));
    } else {
      emit(state.copyWith(
          homestatus: Status.failure, errorMessage: data.message));
    }
  }

  void _onTabIndexChangeEvent(OnTabIndexChangeEvent event, Emitter emit) {
    // final categoryFilter = ['house', 'apartment', 'office', 'land'];
    // // final filteredData = state.data!.data.where((e) => e.type == categoryFilter [state.index]).toList();
    // // print(filteredData.length);
    emit(state.copyWith(index: event.index));
  }

  void _onProductDelete(OnProductDelete event, Emitter emit) async {
    emit(state.copyWith(productstatus: Status.loading));
    final result = await productRepository.deleteProduct(event.id);
    if (result.status == true) {
      final PropertyModel data = await productRepository.getPropertyData();
      if (data.status == true) {
        emit(state.copyWith(productstatus: Status.success, data: data));
      } else {
        emit(state.copyWith(
            productstatus: Status.failure, errorMessage: data.message));
      }
    } else {
      emit(
          state.copyWith(productstatus: Status.failure, errorMessage: 'error'));
    }
  }
}
