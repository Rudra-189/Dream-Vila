import 'package:dreamvila/core/utils/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/api_config/client/api_client.dart';
import '../../core/utils/ImagePickerUtils.dart';
import '../../repository/productRepository.dart';
import 'add_product_event.dart';
import 'add_product_state.dart';


class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final productRepository = ProductRepository(ApiClient());
  final ImagePickerUtils imagePickerUtils;

  AddProductBloc(this.imagePickerUtils) : super(AddProductState.initial()) {
    on<AddImagesEvent>(_addImagesEvent);
    on<OnProductAddButtonSubmitEvent>(_onProductAddButtonSubmitEvent);
    on<OnCancelImageEvent>(_onCancelImageEvent);
    on<OnDisposeEvent>(_onDisposeEvent);
  }

  void _addImagesEvent(AddImagesEvent event,Emitter emit)async{
    List<String> images = List<String>.from(state.images ?? []);
    List<XFile>? file = await imagePickerUtils.pickMultipleImageFromGallery();
    file?.map((e)=>images.add(e.path.toString())).toList();
    emit(state.copyWith(images: images,thumbnail: file?[0].path));
  }

  void _onProductAddButtonSubmitEvent(OnProductAddButtonSubmitEvent event,Emitter emit)async{
    emit(state.copyWith(addProductStatus: status.loading));
    final result = await productRepository.addProduct(event.product);
    if(result){
      emit(state.copyWith(addProductStatus: status.success));
    }else{
      emit(state.copyWith(addProductStatus: status.failure,errorMessage: 'error'));
    }

  }

  void _onCancelImageEvent(OnCancelImageEvent event,Emitter emit){
    List<String> images = List<String>.from(state.images ?? []);
    images.removeAt(event.index);
    emit(state.copyWith(images: images));
  }
  void _onDisposeEvent(OnDisposeEvent event, Emitter emit) {
    state.titleController.text = '';
    state.descriptionController.text = '';
    state.addressController.text = '';
    state.priceController.text = '';
    state.discountPercentageController.text = '';
    state.ratingController.text = '';
    state.plotController.text = '';
    state.typeController.text = '';
    state.bedroomController.text = '';
    state.hallController.text = '';
    state.kitchenController.text = '';
    state.washroomController.text = '';
    state.images!.clear();
  }
}
