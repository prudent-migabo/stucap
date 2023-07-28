import 'package:flutter/material.dart';

import '../../config/app_theme.dart';


Widget customListTile({required String title, Widget? subtitle, Widget? leading}){
  return ListTile(
    leading: leading ?? const CircleAvatar(
      radius: 25,
      backgroundColor: AppThemeData.cardGrey,
      child:  Icon(Icons.person, color: AppThemeData.iconPrimary,),
    ),
    title: Text(
      title,
    ),
    subtitle: subtitle,
  );
}