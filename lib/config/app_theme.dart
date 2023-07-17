import 'package:flutter/material.dart';

class AppThemeData {
  // Colors: Main Colors
  static const Color primaryColor = Color.fromRGBO(21, 101, 192, 1.0);
  static const Color secondaryColor = Color.fromRGBO(255, 255, 255, 1.0);

  // Colors: Text
  static const textPrimary = primaryColor;
  static const textWhite = Color.fromRGBO(255, 255, 255, 1.0);
  static const textBlack = Color.fromRGBO(25, 25, 25, 1.0);
  static const textGreyDark = Color.fromRGBO(147, 147, 147, 1.0);
  static const textGreyLight = Color.fromRGBO(205, 205, 205, 1.0);
  static const textCursor = Color.fromRGBO(61, 61, 61, 1.0);
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
  static const backgroundGrey = Color.fromRGBO(25, 25, 25, 1.0);
  static const backgroundRed = Color.fromRGBO(183, 28, 28, 1.0);
  static const backgroundGreen = Color.fromRGBO(46, 125, 50, 1.0);
  static const cardGrey = Color.fromRGBO(15, 15, 15, 1.0);
  static const cardBlue = Color.fromRGBO(21, 101, 192, 1.0);
  static const tooltip = Color.fromRGBO(33, 33, 33, 1.0);

  // Colors: Opacity
  static const opacityPrimary = Color.fromRGBO(21, 101, 192, 1.0);
  static const opacitySecondary = Color.fromRGBO(255, 255, 255, 0.5019607843137255);

  // Radius
  static const double cornerRadiusCard = 40.0;
  static const double cornerRadiusCardButton = 30.0;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(color: iconPrimary),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.w800,
        color: textBlack,
      ),
      displayMedium: TextStyle(
        fontSize: 54.0,
        fontWeight: FontWeight.w700,
        color: textBlack,
      ),
      displaySmall: TextStyle(
          fontSize: 42.0,
          fontWeight: FontWeight.w700,
          color: AppThemeData.textBlack),
      headlineSmall: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: AppThemeData.textBlack),
      titleLarge: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: AppThemeData.textBlack),
      titleMedium: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: AppThemeData.textBlack),
      titleSmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: AppThemeData.textBlack),
      labelLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppThemeData.textBlack),
      labelMedium: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
          color: AppThemeData.textGreyDark),
    ),
    colorScheme: const ColorScheme.light().copyWith(background: backgroundWhite),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: textCursor,
      selectionHandleColor: textPrimary,
    ),
    inputDecorationTheme:  InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: primaryColor)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: primaryColor, width: 2)
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttonPrimary),
        elevation: MaterialStatePropertyAll(2.0),
      ),
    ),
  );
}