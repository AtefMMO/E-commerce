import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static Color blue = Color(0xff004182);
  static Color white = Color(0xffFFFFFF);
  static Color grey = Color(0xff808080);
  static ThemeData MainTheme = ThemeData(
      primaryColor: blue,
      textTheme: TextTheme(
        titleLarge:
            TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: white,),
       titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: white,),
      ),
  );
}
