import 'package:flutter/material.dart';

import '../config/app_theme.dart';


InputDecoration loginTextFieldsDecoration ({required String hintText, required String labelText}){
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      color: AppThemeData.textGreyDark,
    ),
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: AppThemeData.textGreyDark,
      ),
    );
  }