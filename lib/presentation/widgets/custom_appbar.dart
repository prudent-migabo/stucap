import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar ({required VoidCallback onBackEvent, required String title}){
  return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
    leading: GestureDetector(
      onTap: onBackEvent,
      child: const Icon(Icons.arrow_back_ios_new),
    ),
        title: Text(title),
  ));
}