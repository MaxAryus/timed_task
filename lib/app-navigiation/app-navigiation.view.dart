import 'package:flutter/cupertino.dart';
import 'package:timed_tasks/dashboard/dashboard.view.dart';
import 'package:timed_tasks/todo-overview/todo-overview.view.dart';

class AppNavigation extends StatefulWidget {
  AppNavigation({index, Key? key}) : super(key: key);

  late int index = 0;
  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  List<Widget> tabs = [Dashboard(), ToDoOverview()];

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
              icon: Icon(CupertinoIcons.home),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_bullet),
              label: "ToDo Überischt",
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
