import 'package:flutter/material.dart';
import 'package:stucap/presentation/presentation.dart';

class RouteGenerator {
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case SplashScreen.routeName :
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case LoginScreen.routeName :
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case HomeScreen.routeName :
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case PresenceScreen.routeName :
        return MaterialPageRoute(builder: (context) => const PresenceScreen());
      case PresenceDetailsScreen.routeName :
        return MaterialPageRoute(builder: (context) => const PresenceDetailsScreen());
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Page non trouvée'),
        ),
      );
    }
    );
  }
}