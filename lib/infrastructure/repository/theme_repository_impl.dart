import 'package:firework_distance/domain/model/app_theme_mode.dart';
import 'package:firework_distance/domain/repository/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ThemeRepositoryのSharedPreferences実装
class ThemeRepositoryImpl implements ThemeRepository {
  static const _themeModeKey = 'theme_mode';

  /// 保存されているテーマモードを取得する
  @override
  Future<AppThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString(_themeModeKey);
    if (themeModeString == null) {
      return AppThemeMode.system;
    }
    return AppThemeMode.values.firstWhere(
      (e) => e.toString() == 'AppThemeMode.$themeModeString',
      orElse: () => AppThemeMode.system,
    );
  }

  /// テーマモードを保存する
  @override
  Future<void> saveThemeMode(AppThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.name);
  }
}
