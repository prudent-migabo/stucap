import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';

//// Method that throws the response alert dialog for scan event
void scanPresencePopup(BuildContext context, {required Widget? content, required String title, VoidCallback? onPressed, Color? titleColor, Color? actionBtnColor}) {
  final primary = Theme.of(context).primaryColor;
  Widget okButton() {
    return TextButton(
        onPressed: onPressed,
        child: const Text(
          'OK',
          style: TextStyle(
              color: AppThemeData.textGreen,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: const TextStyle(
        color: AppThemeData.textGreen,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: content,
    actions: [
      okButton(),
    ],
  );

  showDialog(
      barrierDismissible: true, context: context, builder: (context) => alert);
}

//// Method that throws the response alert dialog for scan event
void scanVerificationPopup(BuildContext context, {required Widget? content, required Widget title, VoidCallback? onPressed, Color? titleColor, Color? actionBtnColor}) {
  Widget okButton() {
    return TextButton(
        onPressed: onPressed,
        child: const Text(
          'OK',
          style: TextStyle(
            color: AppThemeData.textBlack,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  AlertDialog alert = AlertDialog(
    title: title,
    content: content,
    actions: [
      okButton(),
    ],
  );

  showDialog(
      barrierDismissible: true, context: context, builder: (context) => alert);
}