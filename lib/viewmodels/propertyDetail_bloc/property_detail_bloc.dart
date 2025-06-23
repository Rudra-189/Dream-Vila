import 'package:bloc/bloc.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/models/productDetailModel.dart';
import 'package:dreamvila/viewmodels/propertyDetail_bloc/property_detail_event.dart';
import 'package:dreamvila/viewmodels/propertyDetail_bloc/property_detail_state.dart';
import '../../core/api_config/client/api_client.dart';
import '../../repository/productRepository.dart';

class PropertyDetailBloc extends Bloc<PropertyDetailEvent, PropertyDetailState> {

  final productRepository = ProductRepository(ApiClient());

  PropertyDetailBloc() : super(PropertyDetailState(currentIndex: 0)) {
    on<LoadProductDetailEvent>(_loadProductDetailEvent);
    on<ChangeIndexEvent>(_changeIndexEvent);
  }
  void _loadProductDetailEvent(LoadProductDetailEvent event,Emitter emit)async{
    emit(state.copyWith(detailPageStatus: status.loading));
    final ProductDetailModel data = await productRepository.getPropertyDetail(event.id);
    if(data != null){
      emit(state.copyWith(detailPageStatus: status.success,data: data));
    }else{
      emit(state.copyWith(detailPageStatus: status.failure,errorMessage: 'error'));
    }
  }

  void _changeIndexEvent(ChangeIndexEvent event,Emitter emit){
    emit(state.copyWith(currentIndex: event.index));
  }
}
