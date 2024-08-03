import 'package:cafe_mobile/src/core/constans/color.dart';
import 'package:flutter/material.dart';

class ThemeApp{

  static ThemeData themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      useMaterial3: true,
      textTheme: textThem,
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: kBackgroundColor,
      cardColor: kCardColor,
      primaryColor: kPrimaryColor,
      secondaryHeaderColor: kSecondaryColor,
    );

  static TextTheme textThem = const TextTheme(
    titleLarge: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 17),
    titleSmall: TextStyle(color: Colors.white,fontSize: 18),
    labelSmall: TextStyle(color: Colors.white),
    labelLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), //! price
    bodyLarge: TextStyle(color: kBackgroundColor, fontWeight: FontWeight.bold) //! price
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: kBackgroundColor
  );

}