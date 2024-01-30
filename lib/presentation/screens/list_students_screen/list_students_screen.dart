import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:stucap/utils/utils.dart';

import '../../../config/app_theme.dart';

class ListStudentsScreen extends StatelessWidget {
  static const String routeName = '/ListStudentsScreen';

  ListStudentsScreen({Key? key, this.title}) : super(key: key);

  final StudentsRepository _repository = StudentsRepository();
  String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        onBackEvent: () {
          Navigator.pop(context);
          // Navigator.pushNamedAndRemoveUntil(
          //     context, HomeScreen.routeName, (route) => false);
        },
        title: context.watch<DrawerCubit>().state == 'L0'
            ? 'L0'
            : context.watch<DrawerCubit>().state == 'L1'
                ? 'L1'
                : context.watch<DrawerCubit>().state == 'L2'
                    ? 'L2'
                    : context.watch<DrawerCubit>().state == 'L3'
                        ? 'L3'
                        : context.watch<DrawerCubit>().state == 'M1'
                            ? 'M1'
                            : context.watch<DrawerCubit>().state == 'M2'
                                ? 'M2'
                                : 'L0',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Builder(builder: (context) {
          final drawerState =
              context.select((DrawerCubit cubit) => cubit.state);
          return BlocBuilder<StudentCubit, StudentState>(
            builder: (context, state) {
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
              return listStudents.isEmpty
                  ? const CustomNoData()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listStudents.length,
                      itemBuilder: (context, index) {
                        final data = listStudents[index];
                        return Column(
                          children: [
                            customListTile(
                              title:
                                  '${data.middleName} ${data.middleName} ${data.lastName}',
                              subtitle: Text(
                                  'FA: ${data.academicFees.toString()}${data.devise}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 70),
                              child: Divider(
                                height: 1,
                                thickness: 0.3,
                                color: AppThemeData.backgroundGrey,
                              ),
                            ),
                          ],
                        );
                      });
            },
          );
        }),
      ),
    );
  }
}
