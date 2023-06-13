import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_example/common/error/auth_error.dart';
import 'package:firebase_auth_example/common/utils/toast.dart';
import 'package:firebase_auth_example/features/auth/repo/delete_auth.dart';
import 'package:firebase_auth_example/features/auth/repo/reset_password.dart';
import 'package:firebase_auth_example/features/auth/repo/sign_in_email.dart';
import 'package:firebase_auth_example/features/auth/repo/sign_in_google.dart';
import 'package:firebase_auth_example/features/auth/repo/sign_out.dart';
import 'package:firebase_auth_example/features/auth/repo/sign_up_email.dart';
import 'package:firebase_auth_example/features/auth/view/profile_screen.dart';
import 'package:firebase_auth_example/features/auth/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authAsyncNotifierCommand = AsyncNotifierProvider<AuthCommand, void>(() {
  return AuthCommand();
});

// commandなので必ずvoid型でなければならない。
class AuthCommand extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // commandなので必ずvoid型でなければならない。
  }

  Future<void> signUpEvent({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      state = const AsyncLoading();
      await signUpEmail(
        email: email,
        password: password,
      ); // this future can fail
      state = const AsyncValue.data(null);

      if (!state.isLoading && !state.hasError) {
        if (context.mounted) {
          context.goNamed(ProfileScreen.routeName);
        }
      }
    } on FirebaseAuthException catch (err) {
      final errorMessage = FirebaseAuthErrorExt.fromCode(err.code).message;
      await toast(errorMessage);
      state = const AsyncValue.data(null);
    }
  }

  Future<void> signInEvent({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      state = const AsyncLoading();
      await signInEmail(email: email, password: password);
      state = const AsyncValue.data(null);

      if (!state.isLoading && !state.hasError) {
        if (context.mounted) {
          context.goNamed(ProfileScreen.routeName);
        }
      }
    } on FirebaseAuthException catch (err) {
      final errorMessage = FirebaseAuthErrorExt.fromCode(err.code).message;
      await toast(errorMessage);
      state = const AsyncValue.data(null);
    }
  }

  Future<void> signInGoogleEvent({
    required BuildContext context,
  }) async {
    try {
      state = const AsyncLoading();
      await signInGoogle();
      state = const AsyncValue.data(null);

      if (!state.isLoading && !state.hasError) {
        if (context.mounted) {
          context.goNamed(ProfileScreen.routeName);
        }
      }
    } on FirebaseAuthException catch (err) {
      final errorMessage = FirebaseAuthErrorExt.fromCode(err.code).message;
      await toast(errorMessage);
      state = const AsyncValue.data(null);
    }
  }

  Future<void> signOutEvent() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => signOut(),
    );
  }

  Future<void> resetPasswordEvent({
    required String email,
    required BuildContext context,
  }) async {
    try {
      state = const AsyncLoading();
      await resetPassword(
        email: email,
      );
      state = const AsyncValue.data(null);

      if (!state.isLoading && !state.hasError) {
        if (context.mounted) {
          context.pop();
          await toast('メールを送信しました');
        }
      }
    } on FirebaseAuthException catch (err) {
      final errorMessage = FirebaseAuthErrorExt.fromCode(err.code).message;
      await toast(errorMessage);
      state = const AsyncValue.data(null);
    }
  }

  Future<void> deleteAuthEvent({
    required BuildContext context,
  }) async {
    try {
      state = const AsyncLoading();
      await deleteAuth();
      state = const AsyncValue.data(null);

      if (!state.isLoading && !state.hasError) {
        if (context.mounted) {
          context.goNamed(SignUpScreen.routeName);
          await toast('ユーザーを削除しました');
        }
      }
    } on FirebaseAuthException catch (err) {
      final errorMessage = FirebaseAuthErrorExt.fromCode(err.code).message;
      await toast(errorMessage);
      state = const AsyncValue.data(null);
    }
  }
}
