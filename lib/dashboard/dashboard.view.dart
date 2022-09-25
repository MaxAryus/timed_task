import 'package:flutter/cupertino.dart';
import 'package:timed_tasks/shared/widget/ContainerCard.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Dashboard"),
      ),
      child: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ContainerCard(
                  child: Text('asdf'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
