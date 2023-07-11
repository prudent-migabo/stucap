import 'package:flutter/material.dart';
import 'package:stucap/presentation/presentation.dart';

class PresenceDetailsScreen extends StatefulWidget {
  static const String routeName = '/PresenceDetailsScreen';
  const PresenceDetailsScreen({Key? key}) : super(key: key);


  @override
  State<PresenceDetailsScreen> createState() => _PresenceDetailsScreenState();
}

class _PresenceDetailsScreenState extends State<PresenceDetailsScreen> {

  int _selectedIndex = 0;
  List<Widget> _pages = [
    PresenceScannerTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 7,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: 30,
          selectedIconTheme: IconThemeData(color: primary),
          selectedItemColor: primary,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner, size: 25),
              label: 'Scanner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people, size: 25),
              label: 'Liste',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}