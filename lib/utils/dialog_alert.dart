import 'package:flutter/material.dart';

//// Method that throws the response alert dialog for scan event
void popupForScanPresenceAction(BuildContext context, {required Widget? content, required String title, VoidCallback? onPressed, Color? titleColor, Color? actionBtnColor}) {
  final primary = Theme.of(context).primaryColor;
  Widget okButton() {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          'OK',
          style: TextStyle(
              color: primary),
        ));
  }

  AlertDialog alert = AlertDialog(
    insetPadding: const EdgeInsets.symmetric(vertical: 30),
    title: Text(
      title,
    ),
    content: content,
    actions: [
      okButton(),
    ],
  );

  showDialog(
      barrierDismissible: false, context: context, builder: (context) => alert);
}