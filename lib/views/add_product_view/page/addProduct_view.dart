import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/models/property_model/product_data_model.dart';
import 'package:dreamvila/viewmodels/add_product_bloc/add_product_bloc.dart';
import 'package:dreamvila/viewmodels/add_product_bloc/add_product_event.dart';
import 'package:dreamvila/viewmodels/add_product_bloc/add_product_state.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {

  bool isUpdate;
  Property? data;

  AddProductView({super.key, required this.isUpdate,this.data});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isUpdate && !context.read<AddProductBloc>().state.isInitialized) {
        context.read<AddProductBloc>().add(InitializeProductEvent(data!));
      }else if (!isUpdate && context.read<AddProductBloc>().state.isInitialized){
        context.read<AddProductBloc>().add(OnDisposeEvent());
      }
    });
    return WillPopScope(
      onWillPop: () async {
        context.read<AddProductBloc>().add(OnDisposeEvent());
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
                          text: isUpdate ? Lang.of(context).lbl_update_product:Lang.of(context).lbl_add_product,
                          buttonTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                          buttonStyle: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).customColors.primaryColor,
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
      ),
    );
  }

  void _submit(BuildContext context, AddProductState state) {
    if (state.formKey.currentState!.validate()) {
      final product = AddProductModel(
        title: state.titleController.text,
        description: state.descriptionController.text,
        address: state.addressController.text,
        price: double.tryParse(state.priceController.text) ?? 0,
        discountPercentage: double.tryParse(state.discountPercentageController.text) ?? 0,
        rating: double.tryParse(state.ratingController.text) ?? 0,
        plot: int.tryParse(state.plotController.text) ?? 0,
        type: state.typeController.text,
        bedroom: int.tryParse(state.bedroomController.text) ?? 0,
        hall: int.tryParse(state.hallController.text) ?? 0,
        kitchen: int.tryParse(state.kitchenController.text) ?? 0,
        washroom: int.tryParse(state.washroomController.text) ?? 0,
        thumbnail: state.thumbnail!,
        images: state.images ?? [],
      );

      if (isUpdate == true) {
        context.read<AddProductBloc>().add(OnUpdateProductEvent(product, data!.id));
      } else {
        context.read<AddProductBloc>().add(OnProductAddButtonSubmitEvent(product));
      }
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
      _buildDropdownInput(context,state),
      // LabeledTextField(
      //     label: Lang.of(context).lbl_type,
      //     controller: state.typeController,
      //     inputType: InputType.text),
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
      // _buildImageInput(context,state)
    ],
  );
}

Widget _buildDropdownInput(BuildContext context, AddProductState state) {
  List<String> items = ['house', 'apartment', 'office', 'land'];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Type", style: Theme.of(context).textTheme.bodyLarge),
      SizedBox(height: 5.h),
      SizedBox(
        height: 55.h,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).customColors.borderColor, width: 1.w),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: AbsorbPointer(
            absorbing: false, // Set to true if you want to completely disable interactions
            child: Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  // Explicitly handle focus if needed
                }
              },
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: state.selectedIndex,
                  icon: Icon(Icons.arrow_drop_down),
                  focusColor: Colors.transparent,
                  onChanged: (String? newValue) {
                    // Add debug print to confirm this is being called
                    debugPrint('Dropdown changed to: $newValue');
                    FocusScope.of(context).unfocus();
                    if (newValue != null) {
                      context.read<AddProductBloc>().add(OnDropDownValueChange(newValue));
                    }
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 20.h),
    ],
  );
}

// Widget _buildImageInput(BuildContext context, AddProductState state) {
//   print("imageBuild");
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(Lang.of(context).lbl_upload_images, style: Theme.of(context).textTheme.bodyLarge),
//       SizedBox(height: 30.h),
//       Center(
//         child: DottedBorder(
//           color: Colors.black,
//           strokeWidth: 1,
//           borderType: BorderType.RRect,
//           radius: const Radius.circular(12),
//           dashPattern: const [13, 13],
//           child: state.images!.isNotEmpty
//               ? SizedBox(
//             height: 150.h,
//             width: 250.w,
//             child: Stack(
//               children: [
//                 CarouselSlider.builder(
//                   itemCount: state.images?.length ?? 0,
//                   itemBuilder: (context, index, realIdx) {
//                     return Stack(children: [
//                       CustomImageView(
//                         imagePath: state.images?[index],
//                         height: 150.h,
//                         width: 250.w,
//                         radius: BorderRadius.circular(10.r),
//                       ),
//                       Positioned(
//                         top: -10,
//                         right: -10,
//                         child: IconButton(
//                           icon: const Icon(Icons.cancel_rounded, color: Colors.red),
//                           onPressed: () {
//                             context.read<AddProductBloc>().add(OnCancelImageEvent(index));
//                           },
//                         ),
//                       ),
//                     ]);
//                   },
//                   options: CarouselOptions(
//                     height: 150.h,
//                     viewportFraction: 1.0,
//                     enableInfiniteScroll: false,
//                     autoPlay: false,
//                   ),
//                 ),
//               ],
//             ),
//           )
//               : GestureDetector(
//             onTap: () {
//               // context.read<AddProductBloc>().add(AddImagesEvent());
//             },
//             child: Container(
//               height: 150,
//               width: 250,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF8F8F8),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomImageView(
//                     imagePath: Assets.images.svgs.icons.icCloud.path,
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     "Select Images",
//                     style: TextStyle(color: Color(0xFF2F2F2F)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       )
//     ],
//   );
// }
