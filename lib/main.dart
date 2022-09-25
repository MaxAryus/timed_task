import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:supabase/supabase.dart';
import 'package:timed_tasks/api/api_connection.service.dart';
import 'package:timed_tasks/routes.dart';
import 'package:timed_tasks/shared/log/logger.dart';
import 'package:timed_tasks/shared/shared-prefrences/shared-pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  try {
    await SharedPref.initializeSharedPreference();
  } catch (exception, stackTrace) {
    Log.error(exception.toString(), stackTrace: stackTrace);
    throw ErrorDescription(exception.toString());
  }

  final SupabaseClient _ = await ApiConnectionService().initialize();

  runApp(const TimedTasks());
}

class TimedTasks extends StatelessWidget {
  const TimedTasks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Timed Tasks',
      initialRoute: Routes.getInitialRoute(),
      routes: Routes.getRoutes(),
      theme: const CupertinoThemeData(
        primaryColor: Color(0xFF7FB77E),
        primaryContrastingColor: Color(0xFFFFC090),
        brightness: Brightness.light,
      ),
    );
  }
}
