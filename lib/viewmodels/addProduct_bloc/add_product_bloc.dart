import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/widgets/common_widget/app_toast_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';
import '../../core/api_config/client/api_client.dart';
import '../../core/utils/ImagePickerUtils.dart';
import '../../core/utils/exports.dart';
import '../../repository/productRepository.dart';
import 'add_product_event.dart';
import 'add_product_state.dart';


class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final productRepository = ProductRepository(ApiClient());
  final ImagePickerUtils imagePickerUtils = ImagePickerUtils();

  AddProductBloc() : super(AddProductState.initial()) {
    on<AddImagesEvent>(_addImagesEvent);
    on<OnProductAddButtonSubmitEvent>(_onProductAddButtonSubmitEvent);
    on<OnCancelImageEvent>(_onCancelImageEvent);
    on<InitializeProductEvent>(_initializeProductEvent);
    on<OnUpdateProductEvent>(_onUpdateProductEvent);
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
    if(result.status == true){
      _onDisposeEvent();
      emit(state.copyWith(addProductStatus: status.success));
    }else{
      AppToast.show(message: result.message,type: ToastificationType.error);
      emit(state.copyWith(addProductStatus: status.failure,errorMessage: result.message));
    }

  }

  void _onCancelImageEvent(OnCancelImageEvent event,Emitter emit){
    List<String> images = List<String>.from(state.images ?? []);
    images.removeAt(event.index);
    emit(state.copyWith(images: images));
  }

  void _onDisposeEvent() {
    print("////////////////////////////////////////////////////////////////////////////");
    // Clear controllers
    state.titleController.clear();
    state.descriptionController.clear();
    state.addressController.clear();
    state.priceController.clear();
    state.discountPercentageController.clear();
    state.ratingController.clear();
    state.plotController.clear();
    state.typeController.clear();
    state.bedroomController.clear();
    state.hallController.clear();
    state.kitchenController.clear();
    state.washroomController.clear();

    // Reset form state in bloc
    emit(state.copyWith(
      images: [],
      thumbnail: null,
      addProductStatus: status.init,
      errorMessage: '',
      isInitialized: false,
    ));
  }

  void _initializeProductEvent(InitializeProductEvent event, Emitter emit) {
    if (!state.isInitialized) {
      // Set text controllers only once
      state.titleController.text = event.product.title;
      state.descriptionController.text = event.product.description;
      state.addressController.text = event.product.address;
      state.priceController.text = event.product.price.toString();
      state.discountPercentageController.text = event.product.discountPercentage.toString();
      state.ratingController.text = event.product.rating.toString();
      state.plotController.text = event.product.plot.toString();
      state.typeController.text = event.product.type;
      state.bedroomController.text = event.product.bedroom.toString();
      state.hallController.text = event.product.hall.toString();
      state.kitchenController.text = event.product.kitchen.toString();
      state.washroomController.text = event.product.washroom.toString();

      emit(state.copyWith(
        thumbnail: event.product.thumbnail,
        images: event.product.images,
        isInitialized: true, // so it doesn’t re-run
      ));
    }
  }

  void _onUpdateProductEvent(OnUpdateProductEvent event,Emitter emit)async{
    emit(state.copyWith(addProductStatus: status.loading));
    final result  = await productRepository.updateProduct(event.product,event.id);
    if(result.status == true){
      _onDisposeEvent();
      emit(state.copyWith(addProductStatus: status.success));
    }else{
      AppToast.show(message: result.message,type: ToastificationType.error);
      emit(state.copyWith(addProductStatus: status.failure));
    }
  }
}
