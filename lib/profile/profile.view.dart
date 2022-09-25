import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timed_tasks/auth/service/auth.service.dart';
import 'package:timed_tasks/shared/widget/container_card.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Profil'),
      ),
      child: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              ContainerCard(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text('Profil'),
                    Text('Links'),
                    Text('Kontakt'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ContainerCard(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      var auth = AuthService();
                      auth.signOut();
                    },
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemRed,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                CupertinoIcons.delete,
                                size: 17,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
