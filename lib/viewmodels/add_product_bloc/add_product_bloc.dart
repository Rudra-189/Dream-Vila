import 'package:dreamvila/core/api_config/client/api_client.dart';
import 'package:dreamvila/core/utils/ImagePickerUtils.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/repository/product_repository.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final productRepository = ProductRepository(ApiClient());
  final imagePickerUtils = ImagePickerUtils();

  AddProductBloc() : super(AddProductState.initial()) {
    on<AddImagesEvent>(_onAddImages);
    on<CancelImageEvent>(_onCancelImage);
    on<DropDownChangedEvent>(_onDropDownChanged);
    on<SubmitProductEvent>(_onSubmit);
    on<InitializeProductEvent>(_onInitialize);
    on<DisposeEvent>(_onDispose);
  }

  Future<void> _onAddImages(AddImagesEvent event, Emitter emit) async {
    final files = await imagePickerUtils.pickMultipleImageFromGallery();
    if (files != null && files.isNotEmpty) {
      final paths = files.map((e) => e.path).toList();
      emit(state.copyWith(
        images: [...state.images, ...paths],
        thumbnail: state.thumbnail ?? paths.first,
      ));
    }
  }

  void _onCancelImage(CancelImageEvent event, Emitter emit) {
    final updated = List<String>.from(state.images);
    updated.removeAt(event.index);
    emit(state.copyWith(images: updated));
  }

  void _onDropDownChanged(DropDownChangedEvent event, Emitter emit) {
    state.typeController.text = event.type;
    emit(state.copyWith(selectedType: event.type));
  }

  Future<void> _onSubmit(SubmitProductEvent event, Emitter emit) async {
    emit(state.copyWith(addProductstatus: Status.loading));

    final Map<String, dynamic> product = {
      "title": state.titleController.text,
      "description": state.descriptionController.text,
      "address": state.addressController.text,
      "price": double.tryParse(state.priceController.text) ?? 0,
      "discountPercentage":
          double.tryParse(state.discountPercentageController.text) ?? 0,
      "rating": double.tryParse(state.ratingController.text) ?? 0,
      "plot": int.tryParse(state.plotController.text) ?? 0,
      "type": state.selectedType,
      "bedroom": int.tryParse(state.bedroomController.text) ?? 0,
      "hall": int.tryParse(state.hallController.text) ?? 0,
      "kitchen": int.tryParse(state.kitchenController.text) ?? 0,
      "washroom": int.tryParse(state.washroomController.text) ?? 0,
      "thumbnail": state.thumbnail ?? '',
      "images": state.images,
    };

    final result = event.isUpdate
        ? await productRepository.updateProduct(product, event.id!)
        : await productRepository.addProduct(product);

    if (result.status == true) {
      emit(state.copyWith(addProductstatus: Status.success));
      add(DisposeEvent());
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
    } else {
      emit(state.copyWith(
        addProductstatus: Status.failure,
        errorMessage: result.message,
      ));
    }
  }

  void _onInitialize(InitializeProductEvent event, Emitter emit) {
    if (!state.isInitialized) {
      state.titleController.text = event.product.title;
      state.descriptionController.text = event.product.description;
      state.addressController.text = event.product.address;
      state.priceController.text = event.product.price.toString();
      state.discountPercentageController.text =
          event.product.discountPercentage.toString();
      state.ratingController.text = event.product.rating.toString();
      state.plotController.text = event.product.plot.toString();
      state.typeController.text = event.product.type;
      state.bedroomController.text = event.product.bedroom.toString();
      state.hallController.text = event.product.hall.toString();
      state.kitchenController.text = event.product.kitchen.toString();
      state.washroomController.text = event.product.washroom.toString();

      emit(state.copyWith(
        images: event.product.images,
        thumbnail: event.product.thumbnail,
        selectedType: event.product.type,
        isInitialized: true,
      ));
    }
  }

  void _onDispose(DisposeEvent event, Emitter emit) {
    state.dispose();
    emit(AddProductState.initial());
  }
}
