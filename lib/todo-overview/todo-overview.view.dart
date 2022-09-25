import 'package:flutter/cupertino.dart';
import 'package:timed_tasks/shared/widget/ContainerCard.dart';

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
        middle: Text('Überischt'),
      ),
      child: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              ContainerCard(
                child: Text('Test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
