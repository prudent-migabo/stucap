import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap/business_logic/business_logic.dart';
import 'package:stucap/config/app_theme.dart';
import 'package:stucap/presentation/presentation.dart';

import 'config/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
        BlocProvider(create: (context) => PromotionCubit()),
        BlocProvider(create: (context) => UpdatePresenceCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'STUCAP',
        theme: AppThemeData.lightTheme,
        onGenerateRoute: RouteGenerator.onGeneratedRoutes,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
