import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppThemeHelper {
  static const Color primaryColor = Colors.orange;
  static const Color secondaryColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  static ThemeData get lightTheme {
    return ThemeData(
        colorScheme: ColorScheme.light(
            primary: Color(0XFFFF6F42),
            secondary: Colors.black,
            onPrimary: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Color(0XFFCECCD9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Color(0XFF000000)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        textTheme: GoogleFonts.latoTextTheme(TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xFF000000),
            fontSize: 15.sp,
          ), // normal text
          bodyMedium: TextStyle(
            color: Colors.black54,
            fontSize: 12.sp,
          ), // normal text
          displayLarge: TextStyle(
            color: Color(0xFFA6A6A6),
            fontSize: 13.sp,
          ), //hint text
          titleLarge: TextStyle(color: Colors.black, fontSize: 16.h),
          titleMedium: TextStyle(color: Colors.black, fontSize: 14.h),
          displayMedium: TextStyle(
            color: Color(0XFFFF6F42),
            fontSize: 15,
          ),
        )),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Color(0XFFFF6F42)),
          fillColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateBorderSide.resolveWith((state) {
            return BorderSide(color: Color(0XFFCECCD9), width: 1);
          }),
        ));
  }
}

class CustomColors {
  final Color primaryColor;
  final Color secondaryColor;
  final Color borderColor;
  final Color iconColor;
  final Color cardLowerTextColor;

  const CustomColors(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.borderColor,
      required this.iconColor,
      required this.cardLowerTextColor});

  static const light = CustomColors(
    primaryColor: Color(0XFFFF6F42),
    secondaryColor: Colors.white,
    borderColor: Color(0XFFCECCD9),
    iconColor: Colors.black54,
    cardLowerTextColor: Colors.black38
  );

  static const dark = CustomColors(
    primaryColor: Color(0XFFFF6F42),
    secondaryColor: Colors.white,
    borderColor: Color(0XFFCECCD9),
    iconColor: Colors.black54,
      cardLowerTextColor: Colors.black38
  );
}

extension ThemeDataCustomColors on ThemeData {
  CustomColors get customColors =>
      brightness == Brightness.dark ? CustomColors.dark : CustomColors.light;
}
