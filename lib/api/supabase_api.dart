import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timed_tasks/enviroments/prod_enviroment.dart';

class SupabaseApi {
  Future<SupabaseClient> initialize() async {
    SupabaseClient client;
    if (kReleaseMode) {
      client = SupabaseClient("", "");
    } else {
      client = SupabaseClient(
        Enviroment['url']!,
        Enviroment['key']!,
      );
    }

    return client;
  }
}
