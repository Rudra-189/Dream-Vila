import 'package:dreamvila/core/routes/app_routes.dart';
import 'package:dreamvila/core/utils/status.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_bloc.dart';
import 'package:dreamvila/viewmodels/splash_bloc/splash_state.dart';
import 'package:dreamvila/widgets/common_widget/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc,SplashState>(
        listener: (context,state){
          if(state.splashStatus == status.success){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.signupScreen,(Route<dynamic> route) => false,);
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