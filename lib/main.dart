import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:supabase/supabase.dart';
import 'package:timed_tasks/api/supabase_api.dart';
import 'package:timed_tasks/routes/router.dart';
import 'package:timed_tasks/shared/log/logger.dart';
import 'package:timed_tasks/shared/storage/shared-pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  try {
    await SharedPref.initializeSharedPreference();
    final SupabaseClient _ = await SupabaseApi().initialize();
  } catch (exception, stackTrace) {
    Log.error(exception.toString(), stackTrace: stackTrace);
    throw ErrorDescription(exception.toString());
  }

  runApp(const TimedTasks(isLoggedIn: false));
}

class TimedTasks extends StatelessWidget {
  const TimedTasks({Key? key, required this.isLoggedIn}) : super(key: key);
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Timed Tasks',
      initialRoute: isLoggedIn ? Routes.initialRoute : Routes.initialLoginRoute,
      routes: Routes.getRoutes(),
      theme: const CupertinoThemeData(
        primaryColor: Color(0xFF7FB77E),
        // primaryContrastingColor: Color(0xFFFFC090),
        brightness: Brightness.light,
        scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
      ),
    );
  }
}
