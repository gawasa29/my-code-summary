import 'package:firebase_auth_example/features/auth/repo/refs/auth_refs.dart';
import 'package:firebase_auth_example/features/auth/view/forgotten_password_screen.dart';
import 'package:firebase_auth_example/features/auth/view/profile_screen.dart';
import 'package:firebase_auth_example/features/auth/view/sign_in_screen.dart';
import 'package:firebase_auth_example/features/auth/view/sign_up_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());

final routerProvider = Provider(
  (ref) {
    final authState = ref.watch(authUserProvider);
    return GoRouter(
      navigatorKey: ref.watch(rootNavigatorKey),
      initialLocation: '/SignUp',
      redirect: (context, state) {
        // もし認証状態がロード中またはエラーが発生していれば、リダイレクトは行わない。
        if (authState.isLoading || authState.hasError) return null;
        // この時点で hasData==trueであること、すなわち、認証状態が読み取り可能な値であることを保証する。

        // state.locationで現在のパスが取得できる。
        // ここではユーザーがログインしているかどうかを確認しています。
        final isLoggedIn = authState.valueOrNull != null;
        // ユーザーがログインしていたら true、していなかったら false
        if (isLoggedIn) {
          //現在の位置（state.location）がSignUpまたはSignInページであればProfileに移動
          // コード中の state.location.startsWith('/SignUp') と state.location.startsWith('/SignIn') は、
          // 現在のURLが '/SignUp' や '/SignIn' で始まるかどうかを確認しています。これにより、URLが '/SignUp' または
          // '/SignIn' だけでなく、例えば '/SignUp/123' や '/SignIn/123' のようなサブルートも含まれる場合に対応しています。
          if (state.location.startsWith('/SignUp') ||
              state.location.startsWith('/SignIn')) {
            return '/Profile';
          }
        } else {
          // ユーザーがログインしていない場合、現在の位置がProfileページであれば、
          // ログインページ(/SignIn)にリダイレクトします。
          if (state.location.startsWith('/Profile')) {
            return '/SignIn';
          }
        }
        // nullを返すと、初期位置に設定している場所に移動する。
        return null;
      },
      routes: [
        GoRoute(
          path: '/SignUp',
          name: SignUpScreen.routeName,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SignUpScreen()),
        ),
        GoRoute(
          path: '/SignIn',
          name: SignInScreen.routeName,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SignInScreen()),
          routes: [
            GoRoute(
              path: 'ForgottenPasswordScreen',
              name: ForgottenPasswordScreen.routeName,
              builder: (context, state) => const ForgottenPasswordScreen(),
            )
          ],
        ),
        GoRoute(
          path: '/Profile',
          name: ProfileScreen.routeName,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    );
  },
);
