import 'package:firework_distance/domain/model/app_theme_mode.dart';

/// テーマ設定を操作するための抽象リポジトリ
abstract class ThemeRepository {
  Future<AppThemeMode> getThemeMode();
  Future<void> saveThemeMode(AppThemeMode themeMode);
}
