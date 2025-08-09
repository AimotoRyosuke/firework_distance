import 'package:firework_distance/domain/model/app_theme_mode.dart';
import 'package:firework_distance/domain/repository/theme_repository.dart';
import 'package:firework_distance/infrastructure/repository/theme_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

/// アプリケーションのテーマを管理するNotifier
@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  ThemeNotifier();

  late final ThemeRepository _repository = ref.read(themeRepositoryProvider);

  /// テーマモードを非同期でビルドする
  @override
  Future<AppThemeMode> build() async {
    return _repository.getThemeMode();
  }

  /// テーマモードを設定し、永続化する
  /// [mode] 設定するテーマモード
  void setThemeMode(AppThemeMode mode) {
    _repository.saveThemeMode(mode);
    state = AsyncData(mode);
  }

  /// 現在のテーマモード（システム設定を考慮）を返す
  ThemeMode get currentThemeMode {
    final mode = state.valueOrNull;
    if (mode == AppThemeMode.system) {
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    } else if (mode == AppThemeMode.dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}

/// ThemeRepositoryのProvider
@Riverpod(keepAlive: true)
ThemeRepository themeRepository(Ref ref) {
  return ThemeRepositoryImpl();
}
