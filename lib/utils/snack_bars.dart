import 'package:flutter/material.dart';
import 'package:stucap/static/constants.dart';

import '../config/app_theme.dart';

void snackBarMessenger(
    {required BuildContext context, required String content, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(content, style: TextStyle(fontWeight: bold),),
        backgroundColor: color ?? AppThemeData.backgroundBlack,
      elevation: 2,
      duration: const Duration(seconds: 3),
    ),

  );
}
