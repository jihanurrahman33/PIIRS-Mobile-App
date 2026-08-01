import 'package:shared_preferences/shared_preferences.dart';

/// Abstract contract for tracking first-launch onboarding completion.
abstract class OnboardingStorage {
  Future<bool> isOnboardingCompleted();
  Future<void> setOnboardingCompleted();
}

/// SharedPreferences implementation of [OnboardingStorage].
class SharedPreferencesOnboardingStorage implements OnboardingStorage {
  static const String _key = 'is_onboarding_completed';
  final SharedPreferences? _prefs;

  SharedPreferencesOnboardingStorage({SharedPreferences? prefs})
      : _prefs = prefs;

  @override
  Future<bool> isOnboardingCompleted() async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted() async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}
