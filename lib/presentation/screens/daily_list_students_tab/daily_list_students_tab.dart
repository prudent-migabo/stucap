import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/data/data.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:stucap/utils/utils.dart';

class DailyListStudentTab extends StatelessWidget {
  const DailyListStudentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        onBackEvent: (){
          Navigator.pop(context);
        },
        title: "Lo : Présence d'aujourd'hui",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: StreamBuilder<List<StudentModel>>(
          stream: StudentsRepository().listPresentStudents(),
          builder: (context, snapshot) {
            List<StudentModel>? listStudents = snapshot.data;
            print('================================================================= ${snapshot.data}');
            if (!snapshot.hasData || listStudents!.isEmpty){
              return noDataBanner();
            } else if (snapshot.connectionState == ConnectionState.waiting){
              return noDataBanner();
            } else if (snapshot.hasError){
              errorDialog(context, content: CustomError(message: snapshot.error.toString()));
            }
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listStudents.length,
                itemBuilder: (context, index){
                  final data = listStudents[index];
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text("${data.middleName} ${data.lastName}"),
                    subtitle: Text('FA: ${data.academicFees}\$'),
                  );
                });
          }
        ),
      ),
    );
  }
}
