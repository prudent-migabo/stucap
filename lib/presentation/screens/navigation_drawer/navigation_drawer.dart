import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import '../../../static/data_values.dart';

Widget navigationDrawer (){
  return Container(
     width: 300,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: 180,
          width: double.infinity,
          color: AppThemeData.primaryColor,
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: AppThemeData.backgroundGrey,
                child: Icon(Icons.person),
              ),
              const SizedBox(height: 15,),
              Text(DataValues.appTitle, style: TextStyle(
                color: AppThemeData.textWhite,
              fontWeight: AppThemeData.lightTheme.textTheme.titleMedium!.fontWeight,
                fontSize: AppThemeData.lightTheme.textTheme.headlineSmall!.fontSize,
              ),),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Padding(padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(DataValues.drawerTitle1,),
            ],
          ),
        ),

      ],
    ),
  );
}
