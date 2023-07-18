import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';

class IsLoading extends StatelessWidget {
  const IsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppThemeData.primaryColor,
        ),
      ),
    );
  }
}
