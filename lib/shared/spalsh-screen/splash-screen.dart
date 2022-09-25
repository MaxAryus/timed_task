import 'package:flutter/cupertino.dart';
import 'package:timed_tasks/auth/login.view.dart';
import 'package:timed_tasks/auth/service/auth.service.dart';
import 'package:timed_tasks/dashboard/dashboard.view.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkIfSessionCanBeRevovered();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Text('Splash Screen'),
              ),
              Spacer(),
              CupertinoActivityIndicator(),
              Spacer(),
              Text('v 0.0.1, powerd by a-sites'),
            ],
          ),
        ),
      ),
    );
  }

  checkIfSessionCanBeRevovered() async {
    final sessionRecovered = await AuthService().recoverSession();
    if (sessionRecovered) {
      Navigator.pushReplacementNamed(context, 'dashboard');
    } else {
      Navigator.pushReplacementNamed(context, 'auth/login');
    }
  }
}
