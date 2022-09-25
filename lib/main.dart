import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:supabase/supabase.dart';
import 'package:timed_tasks/routes.dart';
import 'package:timed_tasks/shared/api/supabase-connection.api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final SupabaseClient _ = await SupabaseConnectionApi().initialize();

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
