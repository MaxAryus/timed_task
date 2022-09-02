import 'package:flutter/cupertino.dart';

class ToDoOverview extends StatefulWidget {
  ToDoOverview({Key? key}) : super(key: key);

  @override
  State<ToDoOverview> createState() => _ToDoOverviewState();
}

class _ToDoOverviewState extends State<ToDoOverview> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Text('Todo Überblick'),
    );
  }
}
