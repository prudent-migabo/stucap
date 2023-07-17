import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/presentation/presentation.dart';

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
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index){
              return const ListTile(
                leading: Icon(Icons.person),
                title: Text('Namasele Paul'),
                subtitle: Text('FA: 100\$'),
              );
            }),
      ),
    );
  }
}
