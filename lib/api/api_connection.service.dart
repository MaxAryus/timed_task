import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';

class ApiConnectionService {
  final String _base_dev_url = 'http://localhost:54321';
  final String _base_dev_key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24ifQ.625_WdcF3KHqz5amU0x2X5WWHP-OEs_4qj0ssLNHzTs';

  Future<SupabaseClient> initialize() async {
    SupabaseClient client;
    if (kReleaseMode) {
      client = SupabaseClient("", "");
    } else {
      client = SupabaseClient(
        _base_dev_url,
        _base_dev_key,
      );
    }

    return client;
  }
}
