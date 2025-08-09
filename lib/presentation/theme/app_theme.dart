import 'package:flutter/material.dart';

/// アプリケーションのテーマを定義するクラス
class MaterialTheme {
  /// コンストラクタ
  const MaterialTheme();

  /// ライトテーマのカラースキームを生成する
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3b608f),
      surfaceTint: Color(0xff3b608f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd4e3ff),
      onPrimaryContainer: Color(0xff204876),
      secondary: Color(0xff545f71),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd8e3f8),
      onSecondaryContainer: Color(0xff3d4758),
      tertiary: Color(0xff6d5677),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff6d9ff),
      onTertiaryContainer: Color(0xff543f5e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff191c20),
      onSurfaceVariant: Color(0xff43474e),
      outline: Color(0xff73777f),
      outlineVariant: Color(0xffc3c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3035),
      inversePrimary: Color(0xffa4c9fe),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff001c39),
      primaryFixedDim: Color(0xffa4c9fe),
      onPrimaryFixedVariant: Color(0xff204876),
      secondaryFixed: Color(0xffd8e3f8),
      onSecondaryFixed: Color(0xff111c2b),
      secondaryFixedDim: Color(0xffbcc7db),
      onSecondaryFixedVariant: Color(0xff3d4758),
      tertiaryFixed: Color(0xfff6d9ff),
      onTertiaryFixed: Color(0xff261430),
      tertiaryFixedDim: Color(0xffd9bde3),
      onTertiaryFixedVariant: Color(0xff543f5e),
      surfaceDim: Color(0xffd9dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffededf4),
      surfaceContainerHigh: Color(0xffe7e8ee),
      surfaceContainerHighest: Color(0xffe1e2e9),
    );
  }

  /// ダークテーマのカラースキームを生成する
  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa4c9fe),
      surfaceTint: Color(0xffa4c9fe),
      onPrimary: Color(0xff00315d),
      primaryContainer: Color(0xff204876),
      onPrimaryContainer: Color(0xffd4e3ff),
      secondary: Color(0xffbcc7db),
      onSecondary: Color(0xff263141),
      secondaryContainer: Color(0xff3d4758),
      onSecondaryContainer: Color(0xffd8e3f8),
      tertiary: Color(0xffd9bde3),
      onTertiary: Color(0xff3d2946),
      tertiaryContainer: Color(0xff543f5e),
      onTertiaryContainer: Color(0xfff6d9ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111318),
      onSurface: Color(0xffe1e2e9),
      onSurfaceVariant: Color(0xffc3c6cf),
      outline: Color(0xff8d9199),
      outlineVariant: Color(0xff43474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e9),
      inversePrimary: Color(0xff3b608f),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff001c39),
      primaryFixedDim: Color(0xffa4c9fe),
      onPrimaryFixedVariant: Color(0xff204876),
      secondaryFixed: Color(0xffd8e3f8),
      onSecondaryFixed: Color(0xff111c2b),
      secondaryFixedDim: Color(0xffbcc7db),
      onSecondaryFixedVariant: Color(0xff3d4758),
      tertiaryFixed: Color(0xfff6d9ff),
      onTertiaryFixed: Color(0xff261430),
      tertiaryFixedDim: Color(0xffd9bde3),
      onTertiaryFixedVariant: Color(0xff543f5e),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  /// ライトテーマを生成する
  ThemeData light() {
    return theme(lightScheme());
  }

  /// ダークテーマを生成する
  ThemeData dark() {
    return theme(darkScheme());
  }

  /// カラースキームからThemeDataを生成する
  /// [colorScheme] 使用するカラースキーム
  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );
}
