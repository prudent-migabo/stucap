import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/presentation/presentation.dart';

import '../../../config/app_theme.dart';
import '../../../static/assets.dart';
import '../../../static/data_values.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.studentImg,
            fit: BoxFit.cover,
          ),
          Container(color: AppThemeData.backgroundBlack.withOpacity(0.7)),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DataValues.homeTitle,
                    style: TextStyle(
                      color: AppThemeData.textWhite,
                      fontSize: AppThemeData
                          .lightTheme.textTheme.headlineSmall!.fontSize,
                      fontWeight: AppThemeData
                          .lightTheme.textTheme.titleLarge!.fontWeight,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    DataValues.homeDescription,
                    style: TextStyle(
                      color: AppThemeData.textWhite,
                      fontSize: AppThemeData
                          .lightTheme.textTheme.displayMedium!.fontSize,
                      fontWeight: AppThemeData
                          .lightTheme.textTheme.titleLarge!.fontWeight,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomCard(
                    cardTitle: DataValues.homeCardTitle1,
                    isOnBlackBackground: true,
                    onTap: (){
                      Navigator.pushNamed(context, PresenceScreen.routeName);
                    },
                  ),
                  const SizedBox(height: 20,),
                  CustomCard(
                    onTap: () {
                      context.read<LogoutCubit>().logout();
                     Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
                    },
                    cardTitle: DataValues.homeCardTitle2,
                    isOnBlackBackground: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
