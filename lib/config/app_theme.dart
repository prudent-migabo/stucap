import 'package:flutter/material.dart';

class AppThemeData {
  // Colors: Main Colors
  static const Color primaryColor = Color.fromRGBO(21, 101, 192, 1.0);
  static const Color secondaryColor = Color.fromRGBO(255, 255, 255, 1.0);

  // Colors: Text
  static const textPrimary = primaryColor;
  static const textWhite = Color.fromRGBO(255, 255, 255, 1.0);
  static const textBlack = Color(0xff212121);
  static const textGrey = Color(0xff757575);
  static const textGreen = Color.fromRGBO(46, 125, 50, 1.0);
  static const errorTextColor = Color.fromRGBO(183, 28, 28, 1.0);

  // Colors: Buttons and Icons
  static const buttonPrimary = primaryColor;
  static const buttonSecondary = Color.fromRGBO(50, 50, 50, 1.0);
  static const iconPrimary = primaryColor;
  static const iconSecondary = Color.fromRGBO(25, 25, 25, 1.0);

  // Colors: Background and Cards
  static const backgroundBlack = Color.fromRGBO(18, 18, 18, 1.0);
  static const backgroundWhite = Color.fromRGBO(255, 255, 255, 1.0);
  static const backgroundGrey = Color(0xffBDBDBD);
  static const backgroundRed = Color(0xffB71C1C);
  static const backgroundGreen = Color.fromRGBO(46, 125, 50, 1.0);
  static const cardGrey = Color(0xffEEEEEE);
  static const cardBlue = Color.fromRGBO(21, 101, 192, 1.0);
  static const tooltip = Color.fromRGBO(33, 33, 33, 1.0);

  // Colors: Opacity
  static const opacityPrimary = Color.fromRGBO(21, 101, 192, 1.0);
  static const opacitySecondary = Color.fromRGBO(255, 255, 255, 0.5019607843137255);

  // Radius
  static const double cornerRadiusCard = 40.0;
  static const double cornerRadiusCardButton = 10.0;
  static const double cornerRadiusTextFields = 10.0;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(color: iconPrimary),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: AppThemeData.textBlack),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppThemeData.textBlack),
      titleSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppThemeData.textWhite),
      labelLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppThemeData.textBlack),
    ),
    colorScheme: const ColorScheme.light().copyWith(background: backgroundWhite),
    inputDecorationTheme:  InputDecorationTheme(
      fillColor: AppThemeData.backgroundWhite,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(cornerRadiusTextFields),
        borderSide: const BorderSide(color: backgroundGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(cornerRadiusTextFields),
        borderSide: const BorderSide(color: backgroundGrey),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadiusTextFields),
          borderSide: const BorderSide(color: backgroundGrey, width: 2)
      ),
      hintStyle: const TextStyle(
        color: textGrey,
        fontSize: 14,
      ),
      labelStyle: const TextStyle(
        color: textGrey,
        fontSize: 14,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttonPrimary),
        elevation: MaterialStatePropertyAll(2.0),
      ),
    ),
  );
}