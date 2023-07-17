import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/presentation/presentation.dart';

import 'config/routes.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: SplashScreen.routeName,
    );
  }
}
