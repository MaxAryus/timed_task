import 'package:flutter/material.dart';
import 'package:timed_tasks/app-navigiation/app-navigiation.view.dart';
import 'package:timed_tasks/shared/spalsh-screen/splash-screen.dart';
import 'auth/login/login.view.dart';

class Routes {
  static String initialRoute = '/';

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      // '/': (context) => SplashScreen(),
      '/': (context) => AppNavigation(
            index: getRouteIndex('/dashboard'),
          ),
      'login': (context) => Login(),
      'dashboard': (context) => AppNavigation(
            index: getRouteIndex('/dashboard'),
          ),
    };
  }

  static int getRouteIndex(String route) {
    switch (route) {
      case '/':
        return 0;
      case '/dashboard':
        return 0;
      case '/todo-overview':
        return 1;
      default:
        return 0;
    }
  }
}
