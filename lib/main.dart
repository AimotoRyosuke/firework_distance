import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アプリケーションのエントリーポイント
void main() {
  runApp(
    // Riverpodをアプリケーション全体で利用可能にする
    const ProviderScope(child: MyApp()),
  );
}

/// アプリケーションのルートWidget
class MyApp extends StatelessWidget {
  /// {@macro my_app}
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hanabi Distance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // TODO(user): ここで起動時の画面出し分けロジックを実装する
      home: const Scaffold(body: Center(child: Text('Hanabi Distance App'))),
    );
  }
}
