// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeRepositoryHash() => r'b1a1ea87c5d10576da4fc1f9efc1241b2e160e5b';

/// See also [themeRepository].
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
String _$themeNotifierHash() => r'd06553c97995f54cee8cceb37dc1130c3362dc5a';

/// See also [ThemeNotifier].
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
