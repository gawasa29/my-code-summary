import 'package:firebase_auth_example/common/validate/validate.dart';
import 'package:firebase_auth_example/features/auth/command/auth_command.dart';
import 'package:firebase_auth_example/features/auth/repo/refs/auth_refs.dart';
import 'package:firebase_auth_example/features/auth/view/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});
  static const routeName = 'SignUp';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final state = ref.watch(authAsyncNotifierCommand);
    final authCommand = ref.read(authAsyncNotifierCommand.notifier);
    print(authRef.currentUser?.uid);
    return Scaffold(
      appBar: AppBar(title: const Text('新規登録')),
      body: Center(
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
                    const Text('Sign up', style: TextStyle(fontSize: 25)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          child: const Text('Sing in'),
                          onPressed: () {
                            context.goNamed(SignInScreen.routeName);
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
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: validatePassword,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(hintText: 'Confirm password'),
                      validator: (value) => confirmValidatePassword(
                        value,
                        passwordController.text,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : () async {
                                if (formKey.currentState!.validate()) {
                                  await authCommand.signUpEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                                }
                              },
                        child: state.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Sign up'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Google'),
                        onPressed: () async {
                          await authCommand.signInGoogleEvent(context: context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
