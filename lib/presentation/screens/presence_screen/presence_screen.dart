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
            child: Icon(Icons.home, color: Colors.white,),
        ),
          ),
    ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) {
                final drawerState =
                context.select((DrawerCubit cubit) => cubit.state);
                return Builder(
                  builder: (context) {
                    final state =
                    context.select((StudentCubit cubit) => cubit.state);
                    List<StudentModel> listStudents = state.students
                        .where((element) {
                      String value = drawerState == 'L0'
                          ? 'L0'
                          : drawerState == 'L1'
                          ? 'L1'
                          : drawerState == 'L2'
                          ? 'L2'
                          : drawerState == 'L3'
                          ? 'L3'
                          : drawerState == 'M1'
                          ? 'M1'
                          : drawerState == 'M2'
                          ? 'M2'
                          : 'L0';
                      return element.promotion == value;
                    })
                        .where((element) {
                      return element.inscriptionStatus == true;
                    })
                        .toList();
                    return GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CustomCardPresenceDash(
                            onTap: () {
                              context.read<DrawerCubit>().selectManagementIndex(0);
                              Navigator.pushNamed(
                                  context, PresenceDetailsScreen.routeName);
                            },
                            title: 'L0',
                        ),
                        CustomCardPresenceDash(
                            onTap: () {
                              context.read<DrawerCubit>().selectManagementIndex(1);
                              Navigator.pushNamed(
                                  context, PresenceDetailsScreen.routeName);
                            },
                          title: 'L1',
                        ),
                        CustomCardPresenceDash(
                            onTap: () {
                              context.read<DrawerCubit>().selectManagementIndex(2);
                              Navigator.pushNamed(
                                  context, PresenceDetailsScreen.routeName);
                            },
                          title: 'L2',
                        ),
                        CustomCardPresenceDash(
                            onTap: () {
                              context.read<DrawerCubit>().selectManagementIndex(3);
                              Navigator.pushNamed(
                                  context, PresenceDetailsScreen.routeName);
                            },
                          title: 'L3',
                        ),
                        CustomCardPresenceDash(
                            onTap: () {
                              context.read<DrawerCubit>().selectManagementIndex(4);
                              Navigator.pushNamed(
                                  context, PresenceDetailsScreen.routeName);
                            },
                          title: 'M1',
                        ),
                        CustomCardPresenceDash(
                            onTap: () {
                              context.read<DrawerCubit>().selectManagementIndex(5);
                              Navigator.pushNamed(
                                  context, PresenceDetailsScreen.routeName);
                            },
                          title: 'M2',
                        ),
                      ],
                    );
                  }
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
