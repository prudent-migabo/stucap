import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/presentation/presentation.dart';

import '../../../config/app_theme.dart';
import '../../../static/constants.dart';
import '../../../static/data_values.dart';

Widget navigationDrawer (BuildContext context){
  return Container(
     width: MediaQuery.of(context).size.width * 0.8,
    color: Colors.white,
    child: ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: 170,
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
                  context.read<PromotionCubit>().addPromotion(1);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription2,
                onPressed: (){
                  context.read<PromotionCubit>().addPromotion(2);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription3,
                onPressed: (){
                  context.read<PromotionCubit>().addPromotion(3);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription4,
                onPressed: (){
                  context.read<PromotionCubit>().addPromotion(4);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription5,
                onPressed: (){
                  context.read<PromotionCubit>().addPromotion(5);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription6,
                onPressed: (){
                  context.read<PromotionCubit>().addPromotion(6);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
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
