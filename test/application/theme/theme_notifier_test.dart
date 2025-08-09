import 'package:firework_distance/application/theme/theme_notifier.dart';
import 'package:firework_distance/domain/model/app_theme_mode.dart';
import 'package:firework_distance/domain/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_notifier_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {
  group('ThemeNotifier', () {
    late MockThemeRepository mockThemeRepository;
    late ProviderContainer container;

    setUp(() {
      mockThemeRepository = MockThemeRepository();
      container = ProviderContainer(
        overrides: [
          themeRepositoryProvider.overrideWithValue(mockThemeRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('リポジトリから初期テーマをロードするべき', () async {
      when(
        mockThemeRepository.getThemeMode(),
      ).thenAnswer((_) async => AppThemeMode.dark);

      final themeNotifier = container.read(themeNotifierProvider.notifier);
      await container.pump(); // ビルドメソッドの完了を待つ

      expect(themeNotifier.state.value, AppThemeMode.dark);
      verify(mockThemeRepository.getThemeMode()).called(1);
    });

    test('setThemeModeは状態を更新し、リポジトリに保存するべき', () async {
      when(
        mockThemeRepository.getThemeMode(),
      ).thenAnswer((_) async => AppThemeMode.light);
      when(mockThemeRepository.saveThemeMode(any)).thenAnswer((_) async => {});

      final themeNotifier = container.read(themeNotifierProvider.notifier);
      await container.pump(); // ビルドメソッドの完了を待つ

      expect(themeNotifier.state.value, AppThemeMode.light);

      themeNotifier.setThemeMode(AppThemeMode.dark);
      await container.pump(); // 状態更新を待つ

      expect(themeNotifier.state.value, AppThemeMode.dark);
      verify(mockThemeRepository.saveThemeMode(AppThemeMode.dark)).called(1);
    });

    group('currentThemeMode', () {
      setUp(TestWidgetsFlutterBinding.ensureInitialized);

      test(
        'システムがダークモードでAppThemeModeがシステムの場合、ThemeMode.darkを返す',
        () async {
          final binding = TestWidgetsFlutterBinding.instance;
          binding.platformDispatcher.platformBrightnessTestValue =
              Brightness.dark;

          when(
            mockThemeRepository.getThemeMode(),
          ).thenAnswer((_) async => AppThemeMode.system);

          final themeNotifier = container.read(themeNotifierProvider.notifier);
          await container.pump();

          expect(themeNotifier.currentThemeMode, ThemeMode.dark);
        },
      );

      test(
        'システムがライトモードでAppThemeModeがシステムの場合、ThemeMode.lightを返す',
        () async {
          final binding = TestWidgetsFlutterBinding.instance;
          binding.platformDispatcher.platformBrightnessTestValue =
              Brightness.light;

          when(
            mockThemeRepository.getThemeMode(),
          ).thenAnswer((_) async => AppThemeMode.system);

          final themeNotifier = container.read(themeNotifierProvider.notifier);
          await container.pump();

          expect(themeNotifier.currentThemeMode, ThemeMode.light);
        },
      );

      test('AppThemeModeがダークの場合、ThemeMode.darkを返す', () async {
        when(
          mockThemeRepository.getThemeMode(),
        ).thenAnswer((_) async => AppThemeMode.dark);

        final themeNotifier = container.read(themeNotifierProvider.notifier);
        await container.pump();

        expect(themeNotifier.currentThemeMode, ThemeMode.dark);
      });

      test(
        'AppThemeModeがライトの場合、ThemeMode.lightを返す',
        () async {
          when(
            mockThemeRepository.getThemeMode(),
          ).thenAnswer((_) async => AppThemeMode.light);

          final themeNotifier = container.read(themeNotifierProvider.notifier);
          await container.pump();

          expect(themeNotifier.currentThemeMode, ThemeMode.light);
        },
      );
    });
  });
}
