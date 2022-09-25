import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timed_tasks/auth/service/auth.service.dart';
import 'package:timed_tasks/theme/theme-colors.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late AuthService authService;
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService = AuthService();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _password.dispose();
    _email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      child: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Container(
                  width: 600,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Registrierung',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ThemeColors.primary,
                            ),
                          ),
                          SizedBox(height: 36),
                          CupertinoTextField(
                            padding: EdgeInsets.all(12),
                            controller: _email,
                            placeholder: 'E-Mail',
                          ),
                          SizedBox(height: 16),
                          CupertinoTextField(
                            padding: EdgeInsets.all(12),
                            controller: _password,
                            placeholder: 'Passwort',
                          ),
                          SizedBox(height: 16),
                          TextButton(
                            onPressed: () => register(),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft,
                            ),
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ThemeColors.primary,
                              ),
                              child: Center(
                                child: Text(
                                  'Registrieren',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: Text(
                        'Passwort vergessen',
                        style: TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    CupertinoButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, 'auth/login'),
                      },
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    bool success =
        await authService.signUp(_email.value.text, _password.value.text);

    if (success) {
      Navigator.of(context).pushReplacementNamed('dashboard');
    }
  }
}
