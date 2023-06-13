import 'package:firebase_auth_example/common/utils/loader.dart';
import 'package:firebase_auth_example/common/validate/validate.dart';
import 'package:firebase_auth_example/features/auth/command/auth_command.dart';
import 'package:firebase_auth_example/features/auth/view/forgotten_password_screen.dart';
import 'package:firebase_auth_example/features/auth/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});
  static const routeName = 'SignIn';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final state = ref.watch(authAsyncNotifierCommand);
    final authCommand = ref.read(authAsyncNotifierCommand.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('ログイン')),
      body: Stack(
        children: [
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Sign in', style: TextStyle(fontSize: 25)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text('Dont have an account?'),
                            TextButton(
                              child: const Text('Sing up'),
                              onPressed: () {
                                context.goNamed(SignUpScreen.routeName);
                              },
                            ),
                          ],
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
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                          validator: validatePassword,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              context
                                  .goNamed(ForgottenPasswordScreen.routeName);
                            },
                            child: const Text('Forgotten password?'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await authCommand.signInEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context,
                                );
                              }
                            },
                            child: const Text('Sign in'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: state.isLoading ? const Loader() : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
