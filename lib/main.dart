import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:timed_tasks/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Log.

  runApp(const TimedTasks());
}

class TimedTasks extends StatelessWidget {
  const TimedTasks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Timed Tasks',
      initialRoute: Routes.initialRoute,
      routes: Routes.getRoutes(),
      theme: const CupertinoThemeData(
        primaryColor: Color(0xFF7FB77E),
        primaryContrastingColor: Color(0xFFFFC090),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFF7F6DC),
      ),
    );
  }
}
