import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';

import '../../../config/app_theme.dart';
import '../../../static/constants.dart';
import '../../../static/data_values.dart';

class PresenceScreen extends StatelessWidget {
  static const String routeName = '/PresenceScreen';

  const PresenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(onBackEvent: (){}, title: DataValues.presenceTitle),
      drawer: navigationDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text(DataValues.presenceTitleDescription,
                style: TextStyle(
                  fontWeight: bold,
                )),
            const SizedBox(
              height: 40,
            ),
            GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                CustomCard(
                    onTap: () {
                      context.read<PromotionCubit>().addPromotion("L0");

                      Navigator.pushNamed(
                          context, PresenceDetailsScreen.routeName);
                    },
                    cardTitle: 'L0',
                    isOnBlackBackground: false
                ),
                CustomCard(
                    onTap: () {
                      context.read<PromotionCubit>().addPromotion("L1");
                      Navigator.pushNamed(
                          context, PresenceDetailsScreen.routeName);
                    },
                    cardTitle: 'L1',
                    isOnBlackBackground: false),
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
