// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeRepositoryHash() => r'797a295365ab0d213c7cfc3805b4cb8e1faee537';

/// ThemeRepositoryのProvider
///
/// Copied from [themeRepository].
@ProviderFor(themeRepository)
final themeRepositoryProvider = Provider<ThemeRepository>.internal(
  themeRepository,
  name: r'themeRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$themeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemeRepositoryRef = ProviderRef<ThemeRepository>;
String _$themeNotifierHash() => r'bf144dafcfb5ae50535a1a14e9ae84e34fb2320a';

/// アプリケーションのテーマを管理するNotifier
///
/// Copied from [ThemeNotifier].
@ProviderFor(ThemeNotifier)
final themeNotifierProvider =
    AsyncNotifierProvider<ThemeNotifier, AppThemeMode>.internal(
      ThemeNotifier.new,
      name: r'themeNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$themeNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ThemeNotifier = AsyncNotifier<AppThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
