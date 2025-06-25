import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const SplashView();
  }
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc,SplashState>(
        listener: (context,state){
          if(state.splashStatus == status.success){
            NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
          }else if(state.splashStatus == status.failure){
            NavigatorService.pushNamedAndRemoveUntil(AppRoutes.signInScreen);
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
  return CustomImageView(imagePath: Assets.images.pngs.appLogo.path);
}