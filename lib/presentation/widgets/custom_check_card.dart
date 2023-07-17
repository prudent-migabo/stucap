import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';

Widget customCheckCard({required bool isTrue}){
  return CircleAvatar(
    radius: 30,
    backgroundColor: isTrue ? AppThemeData.backgroundGreen: AppThemeData.backgroundRed,
     child: Icon(isTrue ? Icons.check : Icons.close, color: AppThemeData.backgroundWhite,),
  );
}