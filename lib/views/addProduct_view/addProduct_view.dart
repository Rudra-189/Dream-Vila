import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

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

  final TextEditingController discountPercentageController = TextEditingController();

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
                    LabeledTextField(label: 'Title', controller: titleController, inputType: InputType.text),
                    LabeledTextField(label: 'Description', controller: descriptionController, inputType: InputType.text,maxLines: 3,),
                    LabeledTextField(label: 'Address', controller: addressController, inputType: InputType.text),
                    LabeledTextField(label: 'Price', controller: priceController, inputType: InputType.digits),
                    LabeledTextField(label: 'Discount Percentage', controller: discountPercentageController, inputType: InputType.digits),
                    LabeledTextField(label: 'Rating', controller: ratingController, inputType: InputType.text),
                    LabeledTextField(label: 'Plot', controller: plotController, inputType: InputType.digits),
                    LabeledTextField(label: 'Type', controller: typeController, inputType: InputType.text),
                    LabeledTextField(label: 'Bedroom', controller: bedroomController, inputType: InputType.digits),
                    LabeledTextField(label: 'Hall', controller: hallController, inputType: InputType.digits),
                    LabeledTextField(label: 'Kitchen', controller: kitchenController, inputType: InputType.digits),
                    LabeledTextField(label: 'Washroom', controller: washroomController, inputType: InputType.digits),
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
                    SizedBox(
                      height: 100.h,
                      child: state.images!.isEmpty ? Center(
                        child: GestureDetector(
                          onTap: (){
                            context.read<AddProductBloc>().add(AddImagesEvent());
                          },
                          child: DottedBorder(
                            color: Colors.black,
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            dashPattern: [13, 13],
                            child: Container(
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
                        ),
                      ) : ListView.builder(itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Stack(
                            children: [
                              DottedBorder(
                                color: Colors.black,
                                strokeWidth: 1,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                dashPattern: [13, 13],
                                child: Container(
                                  height: 100.h,
                                  width: 100.h,
                                  decoration: BoxDecoration(
                                    color: Color(0XFFF8F8F8),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: CustomImageView(imagePath: state.images?[index],radius: BorderRadius.circular(10.r),),
                                ),
                              ),
                              Positioned(
                                left: 70.w,
                                bottom: 65.h,
                                child: IconButton(onPressed: (){
                                  context.read<AddProductBloc>().add(OnCancelImageEvent(index));
                                }, icon: Icon(Icons.cancel_rounded,color: Colors.red,size: 20.sp,)),
                              )
                            ],
                          ),
                        );
                      },
                        scrollDirection: Axis.horizontal,
                        itemCount: state.images?.length,
                      ),
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
