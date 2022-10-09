import 'package:flutter/cupertino.dart';
import 'package:timed_tasks/home/home_view.dart';
import 'package:timed_tasks/login/login_view.dart';
import 'package:timed_tasks/shared/splash_screen.view.dart';

class Routes {
  static String initialLoginRoute = 'login';
  static String initialRoute = 'home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const SplashScreen(),
      'home': (context) => const HomeView(),
      'login': (context) => const LoginView(),
    };
  }
}
