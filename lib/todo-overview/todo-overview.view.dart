import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timed_tasks/shared/widget/app_bar_icon_button.widget.dart';
import 'package:timed_tasks/todo-overview/widget/create_task_list.widget.dart';

class ToDoOverview extends StatefulWidget {
  ToDoOverview({Key? key}) : super(key: key);

  @override
  State<ToDoOverview> createState() => _ToDoOverviewState();
}

class _ToDoOverviewState extends State<ToDoOverview> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Aufgaben'),
        trailing: AppBarIconButton(
          icon: Icon(
            CupertinoIcons.add,
            size: 20,
          ),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CreateTaskList(),
              semanticsDismissible: true,
            );
          },
          hint: 'Liste hinzufügen',
        ),
      ),
      child: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text('Test'),
              );
            },
          ),
        ),
      ),
    );
  }
}
