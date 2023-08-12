import 'dart:math';

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
      appBar: customAppBar(onBackEvent: (){
        Navigator.pop(context);
      }, title: DataValues.presenceTitle,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
            },
            child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.home),
        ),
          ),
    ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CustomCardPresenceDash(
                    onTap: () {
                      context.read<PromotionCubit>().addPromotion(1);
                      Navigator.pushNamed(
                          context, PresenceDetailsScreen.routeName);
                    },
                    title: 'L0',
                  description1: '100',
                  description2: '5',
                ),
                CustomCardPresenceDash(
                    onTap: () {
                      context.read<PromotionCubit>().addPromotion(2);
                      Navigator.pushNamed(
                          context, PresenceDetailsScreen.routeName);
                    },
                  title: 'L1',
                  description1: '120', description2: '10',
                ),
                CustomCardPresenceDash(
                    onTap: () {
                      context.read<PromotionCubit>().addPromotion(3);
                      Navigator.pushNamed(
                          context, PresenceDetailsScreen.routeName);
                    },
                  title: 'L2',
                  description1: '70', description2: '20',
                ),
                CustomCardPresenceDash(
                    onTap: () {
                      context.read<PromotionCubit>().addPromotion(4);
                      Navigator.pushNamed(
                          context, PresenceDetailsScreen.routeName);
                    },
                  title: 'L3',
                  description1: '80', description2: '27',
                ),
                CustomCardPresenceDash(
                    onTap: () {
                      context.read<PromotionCubit>().addPromotion(5);
                      Navigator.pushNamed(
                          context, PresenceDetailsScreen.routeName);
                    },
                  title: 'M1',
                  description1: '50', description2: '10',
                ),
                CustomCardPresenceDash(
                    onTap: () {
                      context.read<PromotionCubit>().addPromotion(6);
                      Navigator.pushNamed(
                          context, PresenceDetailsScreen.routeName);
                    },
                  title: 'M2',
                  description1: '20', description2: '7',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
