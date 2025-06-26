import 'dart:developer';

import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/widgets/common_widget/app_toast_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';
import '../../core/api_config/client/api_client.dart';
import '../../core/utils/ImagePickerUtils.dart';
import '../../core/utils/exports.dart';
import '../../repository/product_repository.dart';
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
    on<OnDisposeEvent>(_onDisposeEvent);
    on<OnDropDownValueChange>(_onDropDownValueChange);
  }

  void _addImagesEvent(AddImagesEvent event,Emitter emit)async{
    log("AddImagesEvent triggered - Stack trace: ${StackTrace.current}");
    List<XFile>? files = await imagePickerUtils.pickMultipleImageFromGallery();

    if (files != null && files.isNotEmpty) {
      List<String> updatedImages = List<String>.from(state.images ?? []);
      updatedImages.addAll(files.map((e) => e.path));
      String? thumbnail = state.thumbnail ?? files.first.path;
      emit(state.copyWith(images: updatedImages, thumbnail: thumbnail));
    }

  }

  void _onProductAddButtonSubmitEvent(OnProductAddButtonSubmitEvent event,Emitter emit)async{
    emit(state.copyWith(addProductStatus: status.loading));
    Map<String,dynamic> data = {
      'title': event.product.title,
      'description': event.product.description,
      'address': event.product.address,
      'price': event.product.price,
      'discountPercentage': event.product.discountPercentage,
      'rating': event.product.rating,
      'plot': event.product.plot,
      'type': event.product.type,
      'bedroom': event.product.bedroom,
      'hall': event.product.hall,
      'kitchen': event.product.kitchen,
      'washroom': event.product.washroom,
      'thumbnail': event.product.thumbnail,
      'images': event.product.images
    };
    final result = await productRepository.addProduct(data);
    if(result.status == true){
      emit(state.copyWith(addProductStatus: status.success));
      add(OnDisposeEvent());
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
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

  void _onDropDownValueChange(OnDropDownValueChange event,Emitter emit){
    state.typeController.text = event.item;
    emit(state.copyWith(selectedIndex: event.item));
  }

  Future<void> close() {
    state.dispose(); // Clean up controllers
    return super.close();
  }

  void _onDisposeEvent(OnDisposeEvent event,Emitter emit){
    log("/////////////////////////////_initializeProductEvent///");
    state.dispose();
    emit(AddProductState.initial());
  }

  void _initializeProductEvent(InitializeProductEvent event, Emitter emit) {
    log("/////////////////////////////_initializeProductEvent///");
    if (!state.isInitialized) {
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
        isInitialized: true,
      ));
    }
  }

  void _onUpdateProductEvent(OnUpdateProductEvent event,Emitter emit)async{
    emit(state.copyWith(addProductStatus: status.loading));
    Map<String,dynamic> data = {
      'title': event.product.title,
      'description': event.product.description,
      'address': event.product.address,
      'price': event.product.price,
      'discountPercentage': event.product.discountPercentage,
      'rating': event.product.rating,
      'plot': event.product.plot,
      'type': event.product.type,
      'bedroom': event.product.bedroom,
      'hall': event.product.hall,
      'kitchen': event.product.kitchen,
      'washroom': event.product.washroom,
      'thumbnail': event.product.thumbnail,
      'images':event.product.images
    };
    final result  = await productRepository.updateProduct(data,event.id);
    if(result.status == true){
      emit(state.copyWith(addProductStatus: status.success));
      add(OnDisposeEvent());
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
    }else{
      AppToast.show(message: result.message,type: ToastificationType.error);
      emit(state.copyWith(addProductStatus: status.failure));
    }
  }
}
