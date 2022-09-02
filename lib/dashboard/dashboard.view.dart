import 'package:flutter/cupertino.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                Container(
                  width: width,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("10 von 20 Aufgaben erledigt"),
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
