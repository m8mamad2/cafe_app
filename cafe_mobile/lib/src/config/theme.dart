import 'package:cafe_mobile/src/core/constans/color.dart';
import 'package:flutter/material.dart';

class ThemeApp{

  static ThemeData themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      useMaterial3: true,
      scaffoldBackgroundColor: kBackgroundColor,
      cardColor: kCardColor,
      primaryColor: kPrimaryColor,
      secondaryHeaderColor: kSecondaryColor,
      textTheme: textThem
    );

  static TextTheme textThem = const TextTheme(
    titleLarge: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 17),
    titleSmall: TextStyle(color: Colors.white,),
  );

}