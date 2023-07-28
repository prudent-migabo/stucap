import 'package:flutter/widgets.dart';

import '../../config/app_theme.dart';
import '../../static/constants.dart';

Widget customRowPopupInfo ({required String title, required String description}){
  return Row(
    children: [
      Expanded(child: Text(title, style: TextStyle(
        fontSize: AppThemeData.lightTheme.textTheme.titleSmall!.fontSize,
      ),)),
      const SizedBox(width: 10,),
      Expanded(
        child: Text(description,
          style: TextStyle(
            fontSize: AppThemeData.lightTheme.textTheme.titleSmall!.fontSize,
            fontWeight: bold,
          ),
        ),
      ),
    ],
  );
}
