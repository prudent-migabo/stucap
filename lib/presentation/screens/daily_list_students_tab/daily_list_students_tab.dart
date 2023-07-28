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

   String filterReference = 'L0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: BlocBuilder<PromotionCubit, PromotionState>(
          builder: (context, state) {
            print('[[[[[[[[[[[[]]]]]]]]]]]][[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ${state.index}');
            return Text(state.index == 1
                ? "L0 : Présence d'aujourd'hui"
                : state.index == 2
                ? "L1 : Présence d'aujourd'hui"
                : state.index == 3
                ? "L2  : Présence d'aujourd'hui"
                : state.index == 4
                ? "L3 : Présence d'aujourd'hui"
                : state.index == 5
                ? "M1 : Présence d'aujourd'hui"
                : state.index == 6
                ? "M2 : Présence d'aujourd'hui"
                : "L0 : Présence d'aujourd'hui");
          },
        ),
      ),
      //title: "Lo : Présence d'aujourd'hui",
      body: BlocListener<PromotionCubit, PromotionState>(
        listener: (context, state) {
          if (state.index == 1){
            setState(() {
              filterReference = 'L0';
            });
          } else if (state.index == 2){
            setState(() {
              filterReference = 'L1';
            });
          } else if (state.index == 3){
            setState(() {
              filterReference = 'L2';
            });
          } else if (state.index == 4){
            setState(() {
              filterReference = 'L3';
            });
          } else if (state.index == 5){
            setState(() {
              filterReference = 'M1';
            });
          } else if (state.index == 6){
            setState(() {
              filterReference = 'M2';
            });
          }
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: StreamBuilder<List<StudentModel>>(
              stream: _repository.listPresentStudents('L0'),
              builder: (context, snapshot) {
                print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii$filterReference");
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
      ),
    );
  }
}
