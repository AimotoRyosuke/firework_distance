import 'package:firework_distance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Theme can be switched', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // 初期状態はシステムテーマ（ここではライトテーマと仮定）
    expect(find.text('Hello, Firework Distance App!'), findsOneWidget);
    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.light,
    );

    // ダークテーマに切り替え
    await tester.tap(find.text('Dark Theme'));
    await tester.pumpAndSettle(); // アニメーションが完了するまで待つ

    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.dark,
    );

    // ライトテーマに切り替え
    await tester.tap(find.text('Light Theme'));
    await tester.pumpAndSettle();

    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.light,
    );

    // システムテーマに切り替え (ここではライトテーマと仮定)
    await tester.tap(find.text('System Theme'));
    await tester.pumpAndSettle();

    // システムテーマがライトかダークかはテスト環境に依存するため、ここではライトと仮定
    // 実際のテストでは、モックやテストユーティリティを使ってプラットフォームの明るさを制御することが望ましい
    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.light,
    );
  });
}
