import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/presentation/presentation.dart';

import 'config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STUCAP',
      theme: AppThemeData.lightTheme,
      onGenerateRoute: RouteGenerator.onGeneratedRoutes,
      initialRoute: PresenceScreen.routeName,
    );
  }
}
