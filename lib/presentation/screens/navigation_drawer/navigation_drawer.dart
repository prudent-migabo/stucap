import 'package:flutter/material.dart';
import 'package:stucap/presentation/presentation.dart';

import '../../../config/app_theme.dart';
import '../../../static/constants.dart';
import '../../../static/data_values.dart';

Widget navigationDrawer (BuildContext context){
  return Container(
     width: 300,
    color: Colors.white,
    child: ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DataValues.drawerTitle1,
                style: TextStyle(
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 10,),
              customDrawerListTile(
                title: DataValues.drawerDescription1,
                onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> ListStudentsScreen(
                    title: 'LO',
                  ),),);

                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription2,
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription3,
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription4,
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription5,
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription6,
              ),
              const SizedBox(height: 15,),
              Text(DataValues.drawerTitle2,
                style: TextStyle(
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 10,),
              customDrawerSettingsListTile(
                leading: const Icon(Icons.language),
                title: DataValues.settingsDescription1,
              ),
              customDrawerSettingsListTile(
                leading: const Icon(Icons.dark_mode),
                title: DataValues.settingsDescription2,
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
