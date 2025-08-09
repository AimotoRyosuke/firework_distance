import 'package:firework_distance/application/theme/theme_notifier.dart';
import 'package:firework_distance/domain/model/app_theme_mode.dart';
import 'package:firework_distance/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アプリケーションのエントリポイント
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// アプリケーションのルートWidget
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref
        .watch(themeNotifierProvider)
        .when(
          data:
              (mode) =>
                  ref.watch(themeNotifierProvider.notifier).currentThemeMode,
          loading: () => ThemeMode.system, // ロード中はシステムテーマを使用
          error: (err, stack) => ThemeMode.system, // エラー時もシステムテーマを使用
        );

    return MaterialApp(
      title: 'Firework Distance',
      theme: MaterialTheme().light(),
      darkTheme: MaterialTheme().dark(),
      themeMode: themeMode,
      home: const MyHomePage(), // 仮のホーム画面
    );
  }
}

/// 仮のホーム画面
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firework Distance')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello, Firework Distance App!'),
            Consumer(
              builder: (context, ref, child) {
                final themeNotifier = ref.watch(themeNotifierProvider.notifier);
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        themeNotifier.setThemeMode(AppThemeMode.light);
                      },
                      child: const Text('Light Theme'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        themeNotifier.setThemeMode(AppThemeMode.dark);
                      },
                      child: const Text('Dark Theme'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        themeNotifier.setThemeMode(AppThemeMode.system);
                      },
                      child: const Text('System Theme'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
