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
    final state = context.watch<PromotionCubit>().state;
    return Scaffold(
      appBar: customAppBar(
        onBackEvent: (){
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
        },
        title: MethodsHelper.sortAppbarTitle2(state),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder<List<StudentModel>>(
          stream: _repository.listRegisteredStudents(MethodsHelper.sortStreamTitle(state)),
          builder: (context, snapshot) {
            List<StudentModel>? listStudents = snapshot.data;
            if (!snapshot.hasData || listStudents!.isEmpty) {
              return noDataBanner();
            } else
            if (snapshot.connectionState == ConnectionState.waiting) {
              return noDataBanner();
            } else if (snapshot.hasError) {
              errorDialog(context,
                  content: CustomError(message: snapshot.error.toString()));
            }
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listStudents.length,
                itemBuilder: (context, index){
                  final data = listStudents[index];
                  return Column(
                    children: [
                      customListTile(
                        title: '${data.middleName} ${data.lastName}',
                        subtitle: Text('FA: ${data.academicFees}\$'),
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
          }
        ),
      ),
    );
  }
}