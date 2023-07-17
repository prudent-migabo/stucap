import 'package:flutter/material.dart';

Widget customDrawerListTile({required String title, VoidCallback? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: ListTile(
      leading: const Icon(Icons.people),
      title: Text(title),
    ),
  );
}

Widget customDrawerSettingsListTile({required String title, required Widget leading}) {
  return ListTile(
    leading: leading,
    title: Text(title),
  );
}