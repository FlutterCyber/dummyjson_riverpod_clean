import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/auth_state.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (username.isNotEmpty && password.isNotEmpty) {
      ref.read(authNotifierProvider.notifier).signIn(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Sign In"),
            ),
            const SizedBox(height: 20),
            if (authState is AuthLoading) const CircularProgressIndicator(),
            if (authState is AuthError)
              Text(authState.message, style: const TextStyle(color: Colors.red)),
            if (authState is AuthSuccess)
              Text("Welcome, ${authState.user.firstName}!", style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
