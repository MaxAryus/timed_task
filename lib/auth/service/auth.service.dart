import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:timed_tasks/api/api_connection.service.dart';
import 'package:timed_tasks/shared/log/logger.dart';
import 'package:timed_tasks/shared/shared-prefrences/shared-pref.dart';
import 'package:timed_tasks/shared/widget/snack_bar.widget.dart';

class AuthService {
  late SupabaseClient _client;

  AuthService() {
    ApiConnectionService().initialize().then((value) {
      _client = value;
    });
  }

  static const supabaseSessionKey = 'supabase_session';

  Future<bool> signUp(String email, String password) async {
    final response = await _client.auth.signUp(email, password);
    if (response.error == null) {
      Log.info('Sign up was successful for user ID: ${response.user!.id}');
      _persistSession(response.data!);
      return true;
    }
    Log.error('Sign up error: ${response.error!.message}');
    return false;
  }

  Future<bool> signIn(String email, String password) async {
    final response =
        await _client.auth.signIn(email: email, password: password);
    if (response.error == null) {
      Log.info('Sign in was successful for user ID: ${response.user!.id}');
      _persistSession(response.data!);

      return true;
    }
    Log.error('Sign in error: ${response.error!.message}');
    return false;
  }

  Future<void> _persistSession(Session session) async {
    Log.info('Persisting session string');
    await _client.auth.setAuth(session.accessToken);
    await SharedPref.setValue(supabaseSessionKey, session.persistSessionString);
  }

  Future<bool> recoverSession() async {
    String? sessionKey = await SharedPref.getStringAsync(supabaseSessionKey);
    if (sessionKey.isNotEmpty) {
      Log.info('Found persisted session string, attempting to recover session');
      String jsonStr = await SharedPref.getStringAsync(supabaseSessionKey);
      final response = await _client.auth.recoverSession(jsonStr);
      if (response.error == null) {
        Log.error(
            'Session successfully recovered for user ID: ${response.user!.id}');
        _persistSession(response.data!);
        return true;
      }
    }
    return false;
  }

  Future<bool> signOut() async {
    final response = await _client.auth.signOut();
    if (response.error == null) {
      Log.info('Successfully logged out; clearing session string');
      await SharedPref.removeKey(supabaseSessionKey);
      return true;
    }
    Log.error('Log out error: ${response.error!.message}');
    return false;
  }
}
