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

  final StudentsRepository _repository = StudentsRepository();

   String filterReference = '';

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PromotionCubit>().state;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(MethodsHelper.sortAppbarTitle1(state)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: StreamBuilder<List<StudentModel>>(
            stream: _repository.listPresentStudents(MethodsHelper.sortStreamTitle(state)),
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
                  itemBuilder: (context, index) {
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
