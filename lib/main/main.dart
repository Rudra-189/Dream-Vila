import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

import '../core/app/dreamVila.dart';

void main() {
  runApp(ToastificationWrapper(child: const MyApp()));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor:
        Colors.transparent, // Change this to your desired color
    systemNavigationBarIconBrightness: Brightness.light,
    // Icon color: light or dark
  ));
}
