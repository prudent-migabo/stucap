import 'package:flutter/material.dart';

import '../../config/app_theme.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key, required this.cardTitle, required this.isOnBlackBackground, this.onTap}) : super(key: key);

  String cardTitle;
  bool isOnBlackBackground;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: isOnBlackBackground ? 110 : 180,
        width: double.infinity,
        child: Card(
          elevation: 2,
          color: AppThemeData.cardBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              cardTitle,
              style: TextStyle(
                color: AppThemeData.textWhite,
                fontSize: isOnBlackBackground ? AppThemeData
                    .lightTheme.textTheme.titleMedium!.fontSize : AppThemeData
                    .lightTheme.textTheme.titleLarge!.fontSize,
                fontWeight: AppThemeData
                    .lightTheme.textTheme.headlineSmall!.fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
