import 'package:flutter/material.dart';
import 'package:stucap/static/data_values.dart';

import '../../../config/app_theme.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(DataValues.splashTitle, style: TextStyle(
                color: AppThemeData.textWhite,
                fontSize: AppThemeData.lightTheme.textTheme.displayMedium!.fontSize,
                fontWeight: AppThemeData.lightTheme.textTheme.displaySmall!.fontWeight,
              ),),
              const SizedBox(height: 5),
              Text(DataValues.splashDescription, style: TextStyle(
                color: AppThemeData.textWhite,
                fontSize: AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
                fontWeight: AppThemeData.lightTheme.textTheme.titleSmall!.fontWeight,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
