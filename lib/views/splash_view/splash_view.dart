import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc,SplashState>(
        listener: (context,state){
          if(state.splashStatus == status.success){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.homeScreen,(Route<dynamic> route) => false,);
          }else if(state.splashStatus == status.failure){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.signInScreen,(Route<dynamic> route) => false,);
          }
        },
        builder: (context,state){
          return Center(
            child: _buildSplashWidget(),
          );
        },
      ),
    );
  }
}

Widget _buildSplashWidget(){
  return CustomImageView(imagePath: "assets/images/pngs/app_logo.png");
}