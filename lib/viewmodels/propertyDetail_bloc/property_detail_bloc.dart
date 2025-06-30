import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/property_model/product_detail_model.dart';
import 'package:dreamvila/viewmodels/propertyDetail_bloc/property_detail_event.dart';
import 'package:dreamvila/viewmodels/propertyDetail_bloc/property_detail_state.dart';
import '../../core/api_config/client/api_client.dart';
import '../../repository/product_repository.dart';

class PropertyDetailBloc
    extends Bloc<PropertyDetailEvent, PropertyDetailState> {
  final productRepository = ProductRepository(ApiClient());

  PropertyDetailBloc() : super(PropertyDetailState(currentIndex: 0)) {
    on<LoadProductDetailEvent>(_loadProductDetailEvent);
    on<ChangeIndexEvent>(_changeIndexEvent);
  }
  void _loadProductDetailEvent(
      LoadProductDetailEvent event, Emitter emit) async {
    emit(state.copyWith(detailPagestatus: Status.loading));
    final ProductResponse data =
        await productRepository.getPropertyDetail(event.id);
    emit(state.copyWith(detailPagestatus: Status.success, data: data));
  }

  void _changeIndexEvent(ChangeIndexEvent event, Emitter emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
