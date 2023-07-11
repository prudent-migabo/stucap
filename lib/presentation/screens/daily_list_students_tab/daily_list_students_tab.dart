import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/presentation/presentation.dart';

import '../../../static/data_values.dart';

class DailyListStudentTab extends StatelessWidget {
  const DailyListStudentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        onBackEvent: (){},
        title: "Lo : Présence d'aujourd'hui",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index){
              return ListTile(
                leading: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.person),
                    )),
                title: Text('Namasele Paul'),
              );
            }),
      ),
    );
  }
}
