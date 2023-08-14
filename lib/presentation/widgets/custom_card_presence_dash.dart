import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';

import '../../static/statics.dart';

class CustomCardPresenceDash extends StatelessWidget {
  const CustomCardPresenceDash({Key? key, required this.title, this.onTap, required this.description1, required this.description2}) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final String description1;
  final String description2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: AppThemeData.backgroundWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: const Icon(Icons.more_vert),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppThemeData.textBlack,
                      fontSize: 27,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("$description1 inscrits",
                    style: TextStyle(
                      color: AppThemeData.primaryColor,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text("$description2 présents",
                    style: TextStyle(
                      color: AppThemeData.textGreen,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
