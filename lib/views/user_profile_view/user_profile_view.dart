import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  static Widget builder(BuildContext context){
    return UserProfileView();
  }
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              _buildUserProfile(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildUserProfile(BuildContext context){
  return Column(
    children: [
      Center(
        child: Container(
          height: 100.h,
          width: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all (
                  color: Theme.of(context).customColors.secondaryColor,
                  width: 3.w
              ),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).customColors.borderColor,
                    offset: Offset(2, 2),
                    blurRadius: 10.r
                )
              ]),
          child: CustomImageView(imagePath: Assets.images.pngs.appIcon.path,fit: BoxFit.cover,radius: BorderRadius.circular(10.r),),
        ),
      ),
      SizedBox(height: 20.h,),
      LabeledTextField(label: Lang.of(context).lbl_first_name, controller: TextEditingController(), inputType: InputType.text),
      LabeledTextField(label: Lang.of(context).lbl_last_name, controller: TextEditingController(), inputType: InputType.text),
      LabeledTextField(label: Lang.of(context).lbl_email, controller: TextEditingController(), inputType: InputType.email,readOnly: true,validator: null,),
      LabeledTextField(label: Lang.of(context).lbl_mobil, controller: TextEditingController(), inputType: InputType.email),
      LabeledTextField(label: Lang.of(context).lbl_password, controller: TextEditingController(), inputType: InputType.email),
    ],
  );
}
