import 'package:firebase_chat_example/features/user/repo/refs/auth_refs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/validate/validate.dart';
import '../command/user_command.dart';
import '../query/user_query.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static const routeName = 'Profile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final state = ref.watch(userAsyncNotifierCommand);
    final authCommand = ref.read(userAsyncNotifierCommand.notifier);
    final currentUser = ref.watch(userQueryProvider);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authRef.signOut();
            },
          ),
        ],
      ),
      body: (state.isLoading)
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'name'),
                    validator: validateUserName,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: validateEmail,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                    validator: validatePassword,
                  ),
                  ElevatedButton(
                    child: const Text('User Create'),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await authRef.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        await authCommand.createUserEvent(
                            name: nameController.text);
                      }
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Sign in'),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await authRef.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  ),
                  Text(ref.watch(authUidProvider)),
                  Text(currentUser.valueOrNull?.name ?? ''),
                  currentUser.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, stack) => Text('Error $err'),
                    data: (user) {
                      return Column(
                        children: [
                          Text(user.userId),
                          Text(user.name),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}
