import 'package:flutter/material.dart';
import 'package:stucap/static/statics.dart';

import '../../config/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.text, this.backgroundColor, this.textColor}) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeData.cornerRadiusCardButton),
          )
      ),
      child: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor ?? Colors.white
        ),
      ),
    );
  }
}