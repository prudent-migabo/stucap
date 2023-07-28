import 'package:flutter/material.dart';
import 'package:stucap/presentation/presentation.dart';
import 'package:stucap/static/data_values.dart';

import '../../../config/app_theme.dart';
import '../generate_code.dart';

class PresenceDetailsScreen extends StatefulWidget {
  static const String routeName = '/PresenceDetailsScreen';
    PresenceDetailsScreen({Key? key, this.pageTitle}) : super(key: key);

   String? pageTitle;

  @override
  State<PresenceDetailsScreen> createState() => _PresenceDetailsScreenState();
}

class _PresenceDetailsScreenState extends State<PresenceDetailsScreen> {


  final List<Widget> _pages = [
    PresenceScannerTab(),
    DailyListStudentTab(),
    GenerateCode(),
  ];

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (selectedIndex) {
          setState(() {
            _index = selectedIndex;
          });
        },
        currentIndex: _index,
        selectedLabelStyle: TextStyle(
          fontSize: AppThemeData.lightTheme.textTheme.titleSmall!.fontSize,
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner), label: 'Scanner',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Liste'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.generating_tokens), label: 'Generer code'
          ),
        ],
      ),
    );
  }
}