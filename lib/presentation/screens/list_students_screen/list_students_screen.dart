import 'package:flutter/material.dart';
import 'package:stucap/presentation/presentation.dart';

class ListStudentsScreen extends StatelessWidget {
  static const String routeName = '/ListStudentsScreen';
  ListStudentsScreen({Key? key, this.title}) : super(key: key);

  String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        onBackEvent: (){
          Navigator.pushNamedAndRemoveUntil(context, PresenceScreen.routeName, (route) => false);
        },
        title: title!,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index){
              return ListTile(
                leading: Icon(Icons.person),
                title: Text('Namasele Paul'),
                subtitle: Text('FA: 100\$'),
              );
            }),
      ),
    );
  }
}