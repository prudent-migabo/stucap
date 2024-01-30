import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:stucap/utils/utils.dart';

class DailyListStudentTab extends StatefulWidget {
  DailyListStudentTab({Key? key}) : super(key: key);

  @override
  State<DailyListStudentTab> createState() => _DailyListStudentTabState();
}

class _DailyListStudentTabState extends State<DailyListStudentTab> {

  String filterReference = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(context.watch<DrawerCubit>().state == 'P0'
            ? 'L0'
            : context.watch<DrawerCubit>().state == 'P1'
            ? 'L1'
            : context.watch<DrawerCubit>().state == 'P2'
            ? 'L2'
            : context.watch<DrawerCubit>().state == 'P3'
            ? 'L3'
            : context.watch<DrawerCubit>().state == 'P4'
            ? 'M1'
            : context.watch<DrawerCubit>().state == 'P5'
            ? 'M2'
            : 'L0'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Builder(
          builder: (context) {
            final drawerState = context.select((DrawerCubit cubit) => cubit.state);
            return BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                List<StudentModel> listStudents = state.students.where((element) {
                  String value = drawerState == 'P0'
                      ? 'L0'
                      : drawerState == 'P1'
                      ? 'L1'
                      : drawerState == 'P2'
                      ? 'L2'
                      : drawerState == 'P3'
                      ? 'L3'
                      : drawerState == 'P4'
                      ? 'M1'
                      : drawerState == 'P5'
                      ? 'M2'
                      : 'L0';
                  return element.promotion == value;
                }).where((element) {
                  return element.presenceStatus == true;
                }).toList();
                return listStudents.isEmpty ? const CustomNoData() : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listStudents.length,
                    itemBuilder: (context, index) {
                      final data = listStudents[index];
                      return Column(
                        children: [
                          customListTile(
                            title: '${data.firstName} ${data.middleName} ${data.lastName}',
                            subtitle: Text('FA: ${data.academicFees.toString()}${data.devise}'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Divider(
                              thickness: 0.3,
                              color: AppThemeData.backgroundGrey,
                            ),
                          ),
                        ],
                      );
                    });
              },
            );
          }
        )
      ),
    );
  }
}
