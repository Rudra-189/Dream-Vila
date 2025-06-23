import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocConsumer<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state.addProductStatus == status.success) {
            context.read<AddProductBloc>().add(OnDisposeEvent());
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.homeScreen,
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Form(
                key: state.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    _buildCommonInput(context,state),
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: CustomElevatedButton(
                        height: 0.060.sh,
                        width: 0.85.sw,
                        text: 'Add Product',
                        buttonTextStyle:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                        buttonStyle: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFFF6F42),
                        ),
                        isLoading: state.addProductStatus == status.loading
                            ? true
                            : false,
                        onPressed: () {
                          _submit(context, state);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _submit(BuildContext context, AddProductState state) async {
    if (state.formKey.currentState!.validate()) {
      final product = AddProductModel(
          title: state.titleController.text,
          description: state.descriptionController.text,
          address: state.addressController.text,
          price: double.parse(state.priceController.text),
          discountPercentage: int.parse(state.discountPercentageController.text),
          rating: double.parse(state.ratingController.text),
          plot: int.parse(state.plotController.text),
          type: state.typeController.text,
          bedroom: int.parse(state.bedroomController.text),
          hall: int.parse(state.hallController.text),
          kitchen: int.parse(state.kitchenController.text),
          washroom: int.parse(state.washroomController.text),
          thumbnail: state.thumbnail.toString(),
          images: state.images);
      context
          .read<AddProductBloc>()
          .add(OnProductAddButtonSubmitEvent(product));
    }
  }
}

Widget _buildCommonInput(BuildContext context,AddProductState state){
  return Column(
    children: [
      LabeledTextField(
          label: Lang.of(context).lbl_title,
          controller: state.titleController,
          inputType: InputType.text),
      LabeledTextField(
        label: Lang.of(context).lbl_description,
        controller: state.descriptionController,
        inputType: InputType.text,
        maxLines: 3,
      ),
      LabeledTextField(
          label: Lang.of(context).lbl_address,
          controller: state.addressController,
          inputType: InputType.text),
      LabeledTextField(
          label: Lang.of(context).lbl_price,
          controller: state.priceController,
          inputType: InputType.digits),
      LabeledTextField(
          label: Lang.of(context).lbl_discount_percentage,
          controller: state.discountPercentageController,
          inputType: InputType.digits),
      LabeledTextField(
          label: Lang.of(context).lbl_rating,
          controller: state.ratingController,
          inputType: InputType.text),
      LabeledTextField(
          label: Lang.of(context).lbl_plot,
          controller: state.plotController,
          inputType: InputType.digits),
      LabeledTextField(
          label: Lang.of(context).lbl_type,
          controller: state.typeController,
          inputType: InputType.text),
      LabeledTextField(
          label: Lang.of(context).lbl_bedroom,
          controller: state.bedroomController,
          inputType: InputType.digits),
      LabeledTextField(
          label: Lang.of(context).lbl_hall,
          controller: state.hallController,
          inputType: InputType.digits),
      LabeledTextField(
          label: Lang.of(context).lbl_kitchen,
          controller: state.kitchenController,
          inputType: InputType.digits),
      LabeledTextField(
          label: Lang.of(context).lbl_washroom,
          controller: state.washroomController,
          inputType: InputType.digits),
      CommonImageInput(
        label: Lang.of(context).lbl_upload_images,
        imagePaths: state.images!,
        onTap: () {
          context.read<AddProductBloc>().add(AddImagesEvent());
        },
        onRemove: (value) {
          context.read<AddProductBloc>().add(OnCancelImageEvent(value));
        },
        allowMultiple: true,
      ),
    ],
  );
}
