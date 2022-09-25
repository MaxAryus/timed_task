import 'package:flutter/cupertino.dart';
import 'package:timed_tasks/dashboard/dashboard.view.dart';
import 'package:timed_tasks/profile/profile.view.dart';
import 'package:timed_tasks/todo-overview/todo-overview.view.dart';

class AppNavigation extends StatefulWidget {
  AppNavigation({index, Key? key}) : super(key: key);

  late int index = 0;
  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  List<Widget> tabs = [
    Dashboard(),
    ToDoOverview(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: (value) {
            setState(() {
              widget.index = value;
            });
          },
          currentIndex: widget.index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 24),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_bullet, size: 24),
              label: "Aufgaben",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person, size: 24),
              label: "Profil",
            )
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return tabs[index];
            },
          );
        },
      ),
    );
  }
}
