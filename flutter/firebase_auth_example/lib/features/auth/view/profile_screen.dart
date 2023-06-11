import 'package:firebase_auth_example/features/auth/command/auth_command.dart';
import 'package:firebase_auth_example/features/auth/repo/refs/auth_refs.dart';
import 'package:firebase_auth_example/features/auth/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static const routeName = 'Profile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.goNamed(SignUpScreen.routeName);
              ref.read(authAsyncNotifierCommand.notifier).signOutEvent();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref
                  .read(authAsyncNotifierCommand.notifier)
                  .deleteAuthEvent(context: context);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[Text(ref.watch(authUidProvider))],
      ),
    );
  }
}
