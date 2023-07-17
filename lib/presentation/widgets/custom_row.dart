import 'package:flutter/widgets.dart';

import '../../static/constants.dart';

Widget customRowPopupInfo ({required String title, required String description}){
  return Row(
    children: [
      Expanded(child: Text(title)),
      const SizedBox(width: 10,),
      Expanded(
        child: Text(description,
          style: TextStyle(
            fontWeight: bold,
          ),
        ),
      ),
    ],
  );
}
