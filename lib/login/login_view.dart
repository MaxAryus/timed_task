import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Object segemtnControllerValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Card(
          child: Container(
            width: 300,
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CupertinoSegmentedControl(
                    children: {
                      0: Text('Anmelden'),
                      1: Text('Registrieren'),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        this.segemtnControllerValue = value!;
                      });
                    },
                    groupValue: this.segemtnControllerValue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
