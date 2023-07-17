import 'package:flutter/material.dart';
import 'package:stucap/presentation/presentation.dart';

import '../../../config/app_theme.dart';
import '../../../static/data_values.dart';

class PresenceScreen extends StatelessWidget {
  static const String routeName = '/PresenceScreen';
  const PresenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu, color: AppThemeData.iconSecondary,)),
        ),
      ),
      drawer: navigationDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          // Theme.of(context).textTheme.titleLarge,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DataValues.presenceTitle, style: TextStyle(
              fontSize: AppThemeData.lightTheme.textTheme.titleLarge!.fontSize,
              fontWeight: AppThemeData.lightTheme.textTheme.headlineSmall!.fontWeight,
            )),
            const SizedBox(height: 40,),
            GridView.count(
              mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                CustomCard(cardTitle: 'Lo', isOnBlackBackground: false),
                CustomCard(cardTitle: 'L1', isOnBlackBackground: false),
                CustomCard(cardTitle: 'L2', isOnBlackBackground: false),
                CustomCard(cardTitle: 'L3', isOnBlackBackground: false),
                CustomCard(cardTitle: 'M1', isOnBlackBackground: false),
                CustomCard(cardTitle: 'M2', isOnBlackBackground: false),
              ],
            )
          ],
        ),
      ),
    );
  }
}
