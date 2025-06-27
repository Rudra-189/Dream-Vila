import 'dart:io';

import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

class AddOrUpdateProductScreen extends StatelessWidget {
  final bool isUpdate;
  final Property? product;

  const AddOrUpdateProductScreen({
    super.key,
    required this.isUpdate,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = context.read<AddProductBloc>();
      if (isUpdate && !bloc.state.isInitialized) {
        bloc.add(InitializeProductEvent(product!));
      } else if (!isUpdate && bloc.state.isInitialized) {
        bloc.add(DisposeEvent());
      }
    });

    return WillPopScope(
      onWillPop: () async {
        context.read<AddProductBloc>().add(DisposeEvent());
        return true;
      },
      child: Scaffold(
        body: BlocBuilder<AddProductBloc, AddProductState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Form(
                  key: state.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.h),
                      _buildCommonInputs(context, state),
                      SizedBox(height: 20.h),
                      _buildImageInput(context, state),
                      SizedBox(height: 30.h),
                      Center(
                        child: CustomElevatedButton(
                          height: 0.060.sh,
                          width: 0.85.sw,
                          text: isUpdate ? Lang.of(context).lbl_update_product : Lang.of(context).lbl_add_product,
                          buttonTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
                          buttonStyle: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).customColors.primaryColor,
                          ),
                          isLoading: state.addProductStatus == status.loading,
                          onPressed: () => _submit(context, state),
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _submit(BuildContext context, AddProductState state) {
    if (state.formKey.currentState!.validate()) {
      context.read<AddProductBloc>().add(
        SubmitProductEvent(isUpdate, id: product?.id),
      );
    }
  }

  Widget _buildCommonInputs(BuildContext context, AddProductState state) {
    return Column(
      children: [
        LabeledTextField(label: Lang.of(context).lbl_title, controller: state.titleController,inputType: InputType.text,),
        LabeledTextField(label: Lang.of(context).lbl_description, controller: state.descriptionController, maxLines: 3,inputType: InputType.text,),
        LabeledTextField(label: Lang.of(context).lbl_address, controller: state.addressController, inputType: InputType.text,),
        LabeledTextField(label: Lang.of(context).lbl_price, controller: state.priceController, inputType: InputType.digits),
        LabeledTextField(label: Lang.of(context).lbl_discount, controller: state.discountPercentageController, inputType: InputType.digits),
        LabeledTextField(label: Lang.of(context).lbl_rating, controller: state.ratingController, inputType: InputType.text,),
        LabeledTextField(label: Lang.of(context).lbl_plot, controller: state.plotController, inputType: InputType.digits),
        _buildDropdownInput(context, state),
        LabeledTextField(label: Lang.of(context).lbl_bedroom, controller: state.bedroomController, inputType: InputType.digits),
        LabeledTextField(label: Lang.of(context).lbl_hall, controller: state.hallController, inputType: InputType.digits),
        LabeledTextField(label: Lang.of(context).lbl_kitchen, controller: state.kitchenController, inputType: InputType.digits),
        LabeledTextField(label: Lang.of(context).lbl_washroom, controller: state.washroomController, inputType: InputType.digits),
      ],
    );
  }

  Widget _buildDropdownInput(BuildContext context, AddProductState state) {
    const types = ['house', 'apartment', 'office', 'land'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Lang.of(context).lbl_type, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 5.h),
        DropdownButtonFormField<String>(
          value: state.selectedType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
          items: types.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) {
              context.read<AddProductBloc>().add(DropDownChangedEvent(val));
            }
          },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildImageInput(BuildContext context, AddProductState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Lang.of(context).lbl_upload_images, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () => context.read<AddProductBloc>().add(AddImagesEvent()),
          child: DottedBorder(
            color: Colors.grey,
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            dashPattern: const [8, 4],
            child: Container(
              height: 150.h,
              width: double.infinity,
              alignment: Alignment.center,
              child: state.images.isEmpty
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(imagePath: Assets.images.svgs.icons.icCloud.path,),
                  SizedBox(height: 10.h),
                  Text(Lang.of(context).lbl_select_image),
                ],
              )
                  : SizedBox(
                height: 150.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.images.length,
                  separatorBuilder: (_, __) => SizedBox(width: 10.w),
                  itemBuilder: (context, index) => Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.file(
                          File(state.images[index]),
                          height: 150.h,
                          width: 150.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.cancel, color: Theme.of(context).customColors.primaryColor),
                          onPressed: () => context.read<AddProductBloc>().add(CancelImageEvent(index)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
