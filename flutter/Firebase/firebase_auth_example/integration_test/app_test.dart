import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_example/features/auth/repo/refs/auth_refs.dart';
import 'package:firebase_auth_example/features/auth/view/profile_screen.dart';
import 'package:firebase_auth_example/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  //おまじない
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Auth Test', () {
    testWidgets('start', (WidgetTester tester) async {
      app.main();

      ProviderContainer(
        overrides: [
          authUserProvider.overrideWith(
            (
              StreamProviderRef<User?> ref,
            ) =>
                Stream.value(null),
          ),
        ],
      );

      // 変数定義
      const email = 'test@test.com';
      const password = 'test123';
      //ここからテスト
      //アニメーションなどを待つ描画されなくなるまでtestの実行を待つ。
      await tester.pumpAndSettle();

      // フォームに記入する。
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        email,
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password'),
        password,
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Confirm password'),
        password,
      );
      // SignUp ボタンをタップします。
      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign up'));
      await tester.pumpAndSettle();

      // ProfileScreen に移動していることを確認します。
      expect(find.byType(ProfileScreen), findsOneWidget);
      // logout ボタンをタップします。
      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle();

      // go to SignIn ボタンをタップします。
      await tester.tap(find.widgetWithText(TextButton, 'Sing in'));
      await tester.pumpAndSettle();

      // フォームに記入する。
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'),
        email,
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Password'),
        password,
      );
      // SignIn ボタンをタップします。
      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign in'));
      await tester.pumpAndSettle();

      // ProfileScreen に移動していることを確認します。
      expect(find.byType(ProfileScreen), findsOneWidget);
      // delete ボタンをタップします。
      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();
    });
  });
}
