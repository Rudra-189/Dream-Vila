import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dreamvila/core/routes/app_routes.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/viewmodels/addProduct_bloc/add_product_bloc.dart';
import 'package:dreamvila/viewmodels/addProduct_bloc/add_product_event.dart';
import 'package:dreamvila/viewmodels/addProduct_bloc/add_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/theme_helper.dart';
import '../../core/utils/validation.dart';
import '../../models/addProductModel.dart';
import '../../widgets/common_widget/custom_button.dart';
import '../../widgets/common_widget/custom_textfields.dart';
import '../../widgets/common_widget/image_view.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController discountPercentageController =
      TextEditingController();

  final TextEditingController ratingController = TextEditingController();

  final TextEditingController plotController = TextEditingController();

  final TextEditingController typeController = TextEditingController();

  final TextEditingController bedroomController = TextEditingController();

  final TextEditingController hallController = TextEditingController();

  final TextEditingController kitchenController = TextEditingController();

  final TextEditingController washroomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddProductBloc, AddProductState>(
        listener: (context,state){
          if(state.addProductStatus == status.success){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.homeScreen, (Route<dynamic> route) => false,);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Text("Title",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.text,
                      hintLabel: 'Title',
                      controller: titleController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Title'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Description",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.text,
                      hintLabel: 'Description',
                      controller: descriptionController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Description'),
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Address",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.text,
                      hintLabel: 'Address',
                      controller: addressController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Address'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Price",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.digits,
                      hintLabel: 'Price',
                      controller: priceController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Price'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Discount Percentage",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.digits,
                      hintLabel: 'Discount Percentage',
                      controller: discountPercentageController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) => Validation.validateNotEmpty(
                          value!, 'Discount Percentage'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Rating",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.text,
                      hintLabel: 'Discount Percentage',
                      controller: ratingController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) => Validation.validateNotEmpty(
                          value!, 'Discount Percentage'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Plot",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.digits,
                      hintLabel: 'Plot',
                      controller: plotController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Plot'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Type",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.text,
                      hintLabel: 'Type',
                      controller: typeController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Type'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Bedroom",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.digits,
                      hintLabel: 'Bedroom',
                      controller: bedroomController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Bedroom'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Hall",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.digits,
                      hintLabel: 'Hall',
                      controller: hallController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Hall'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Kitchen",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.digits,
                      hintLabel: 'Kitchen',
                      controller: kitchenController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Kitchen'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Washroom",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextInputField(
                      context: context,
                      type: InputType.digits,
                      hintLabel: 'Washroom',
                      controller: washroomController,
                      hintStyle:
                          MyAppThemeHelper.lightTheme.textTheme.displayLarge,
                      validator: (value) =>
                          Validation.validateNotEmpty(value!, 'Washroom'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Thumbnail",
                        style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        dashPattern: [13, 13],
                        child: GestureDetector(
                          onTap: (){
                            context.read<AddProductBloc>().add(AddThumbnailEvent());
                          },
                          child: state.thumbnail != null ? CustomImageView(imagePath: state.thumbnail,height: 150.h,width: 250.w,radius: BorderRadius.circular(10),) : Container(
                            height: 150.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                              color: Color(0XFFF8F8F8),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                  imagePath:
                                  "assets/images/svgs/icons/ic_cloude.svg",
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "Select Image",
                                  style: TextStyle(color: Color(0XFF2F2F2F)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text("Images", style: MyAppThemeHelper.lightTheme.textTheme.bodyLarge),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Wrap(
                          spacing: 10.w, // Horizontal spacing between images
                          runSpacing: 10.h, // Vertical spacing between rows
                          children: List.generate(3, (index) {
                            final image = state.images!.length > index ? state.images![index] : null;

                            return DottedBorder(
                              color: Colors.black,
                              strokeWidth: 1,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(12),
                              dashPattern: [13, 13],
                              child: GestureDetector(
                                onTap: () {
                                  context.read<AddProductBloc>().add(AddImagesEvent());
                                },
                                child: image != null
                                    ? CustomImageView(
                                  imagePath: image,
                                  height: 100.h,
                                  width: 100.h,
                                  radius: BorderRadius.circular(10),
                                )
                                    : Container(
                                  height: 100.h,
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                    color: Color(0XFFF8F8F8),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                        imagePath: "assets/images/svgs/icons/ic_cloude.svg",
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        "Select Image",
                                        style: TextStyle(color: Color(0XFF2F2F2F)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
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
                        isLoading: state.addProductStatus == status.loading ? true : false,
                        onPressed: () {
                          _submit(context,state);
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
    if (_formKey.currentState!.validate()) {
      final product = AddProductModel(
       title: titleController.text,
        description: descriptionController.text,
        address: addressController.text,
        price: double.parse(priceController.text),
        discountPercentage: int.parse(discountPercentageController.text),
        rating: double.parse(ratingController.text),
        plot: int.parse(plotController.text),
        type: typeController.text,
        bedroom: int.parse(bedroomController.text),
        hall: int.parse(hallController.text),
        kitchen: int.parse(kitchenController.text),
        washroom: int.parse(washroomController.text),
        thumbnail: state.thumbnail.toString(),
        images: state.images
      );
      context.read<AddProductBloc>().add(OnProductAddButtonSubmitEvent(product));
    }
  }
}
