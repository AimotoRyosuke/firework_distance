import 'package:firework_distance/domain/model/app_theme_mode.dart';
import 'package:firework_distance/domain/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  static const _themeModeKey = 'theme_mode';

  @override
  Future<AppThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt(_themeModeKey);
    if (themeModeIndex != null) {
      return AppThemeMode.values[themeModeIndex];
    } else {
      final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark ? AppThemeMode.dark : AppThemeMode.light;
    }
  }

  @override
  Future<void> saveThemeMode(AppThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, themeMode.index);
  }
}
