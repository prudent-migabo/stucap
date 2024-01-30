import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:stucap/utils/dialog_alert.dart';

import '../../../config/app_theme.dart';
import '../../../static/constants.dart';
import '../../../static/data_values.dart';

Widget navigationDrawer (BuildContext context){
  return BlocListener<LogoutCubit, LogoutState>(
  listener: (context, state) {
    if (state is LogoutError){
      errorDialog(context, content: state.message.toString());
    } else if (state is LogoutLoaded){
      successToast(message: 'Deconnecté avec succès');
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
    }
  },
  child: Container(
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
              const CircleAvatar(
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
              const Text(DataValues.drawerTitle1,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10,),
              customDrawerListTile(
                title: DataValues.drawerDescription1,
                onPressed: (){
                  context.read<DrawerCubit>().selectIndex(0);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription2,
                onPressed: (){
                  context.read<DrawerCubit>().selectIndex(1);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription3,
                onPressed: (){
                  context.read<DrawerCubit>().selectIndex(2);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription4,
                onPressed: (){
                  context.read<DrawerCubit>().selectIndex(3);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription5,
                onPressed: (){
                  context.read<DrawerCubit>().selectIndex(4);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              customDrawerListTile(
                title: DataValues.drawerDescription6,
                onPressed: (){
                  context.read<DrawerCubit>().selectIndex(6);
                  Navigator.pushNamed(context, ListStudentsScreen.routeName);
                }
              ),
              const SizedBox(height: 15,),
              const Text(DataValues.drawerTitle2,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
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
        BlocBuilder<LogoutCubit, LogoutState>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
      child: CustomButton(
        backgroundColor: AppThemeData.backgroundRed,
        onPressed: state is LogoutLoading ? (){} : (){
            context.read<LogoutCubit>().logout();
          },
            text: state is LogoutLoading ? 'Patientez...' : 'Déconnexion',),
    );
  },
),
      ],
    ),
  ),
);
}
