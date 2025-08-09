import 'package:firework_distance/domain/model/app_theme_mode.dart';
import 'package:firework_distance/infrastructure/repository/theme_repository_impl.dart';
import 'package:flutter/material.dart'; // For Brightness
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ThemeRepositoryImpl', () {
    late ThemeRepositoryImpl themeRepository;

    setUp(() {
      // 各テストの前にSharedPreferencesを空のマップで初期化
      SharedPreferences.setMockInitialValues({});
      themeRepository = ThemeRepositoryImpl();
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('利用可能な場合、getThemeModeは保存されたテーマを返す', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({
        'theme_mode': AppThemeMode.dark.index,
      });
      themeRepository = ThemeRepositoryImpl();

      // Act
      final themeMode = await themeRepository.getThemeMode();

      // Assert
      expect(themeMode, AppThemeMode.dark);
    });

    test('テーマが保存されていない場合、getThemeModeはシステムテーマを返す', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      themeRepository = ThemeRepositoryImpl();

      // システムの明るさをモック
      final binding = TestWidgetsFlutterBinding.instance;
      binding.platformDispatcher.platformBrightnessTestValue = Brightness.light;

      final themeMode = await themeRepository.getThemeMode();

      expect(themeMode, AppThemeMode.light);

      // ダークシステムテーマの場合を準備
      binding.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
      themeRepository = ThemeRepositoryImpl();

      final darkThemeMode = await themeRepository.getThemeMode();

      expect(darkThemeMode, AppThemeMode.dark);
    });

    test('saveThemeModeはテーマをSharedPreferencesに保存する', () async {
      // Act
      await themeRepository.saveThemeMode(AppThemeMode.system);

      // Assert
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt('theme_mode'), AppThemeMode.system.index);
    });
  });
}
