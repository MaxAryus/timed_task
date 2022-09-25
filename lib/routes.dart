import 'package:flutter/material.dart';
import 'package:timed_tasks/app-navigiation/app-navigiation.view.dart';
import 'package:timed_tasks/auth/login.view.dart';
import 'package:timed_tasks/auth/register.view.dart';
import 'package:timed_tasks/auth/service/auth.service.dart';
import 'package:timed_tasks/shared/spalsh-screen/splash-screen.dart';

class Routes {
  static String initialRoute = '/';

  static getInitialRoute() {
    return initialRoute;
  }

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      '/': (context) => SplashScreen(),
      'dashboard': (context) => AppNavigation(
            index: getRouteIndex('/dashboard'),
          ),
      'todo-overview': (context) => AppNavigation(
            index: getRouteIndex('/todo-overview'),
          ),
      'profile': (context) => AppNavigation(
            index: getRouteIndex('/profile'),
          ),
      'auth/register': (context) => Register(),
      'auth/login': (context) => Login(),
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
      case '/profile':
        return 2;
      default:
        return 0;
    }
  }
}
