import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';

import '../../static/statics.dart';

class CustomCardPresenceDash extends StatelessWidget {
  const CustomCardPresenceDash({Key? key, required this.title, this.onTap,}) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
         color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, right: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.more_vert),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppThemeData.textBlack,
                    fontSize: 27,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
