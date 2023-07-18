import 'package:flutter/material.dart';
import 'package:stucap/static/constants.dart';

import '../../config/app_theme.dart';

Widget noDataBanner (){
  return Container(
    height: 550,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.data_exploration_outlined, color: AppThemeData.backgroundGrey, size: 100,),
        const SizedBox(height: 10,),
        Text('Pas des données', style: TextStyle(fontWeight: bold),),
      ],
    ),
  );
}