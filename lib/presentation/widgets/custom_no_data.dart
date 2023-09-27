import 'package:flutter/material.dart';

import '../../static/statics.dart';

class CustomNoData extends StatelessWidget {
  const CustomNoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Column(
          children: [
            Image.asset(Assets.emptyImage),
            Text(
              'Pas de données',
              style: TextStyle(
                fontWeight: bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
  }
}
