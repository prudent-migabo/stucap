import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';

import '../../../static/data_values.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(DataValues.loginTitle, style: TextStyle(
                color: AppThemeData.primaryColor,
                fontSize: AppThemeData.lightTheme.textTheme.displayMedium!.fontSize,
                fontWeight: AppThemeData.lightTheme.textTheme.displaySmall!.fontWeight,
              ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: DataValues.emailHintAndLabel,
                  labelText: DataValues.emailHintAndLabel,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppThemeData.textGreyDark,
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: DataValues.passwordHintAndLabel,
                  labelText: DataValues.passwordHintAndLabel,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppThemeData.textGreyDark,
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              SizedBox(
                height: 60,
                  child: ElevatedButton(onPressed: (){}, child: Text(
                    DataValues.loginElevatedButtonTitle,
                    style: TextStyle(
                      fontSize: AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
                      fontWeight: AppThemeData.lightTheme.textTheme.titleMedium!.fontWeight,
                    ),
                  ),)),
            ],
          ),
        ),
      ),
    );
  }
}
