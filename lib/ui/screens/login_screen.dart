import 'package:devfest/ui/components/devfest_topbar.dart';
import 'package:devfest/ui/components/logo_animated.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final ValueChanged<String> onLoginClick;
  final ValueChanged<String> onSignInClick;

  const LoginScreen({
    super.key,
    required this.onLoginClick,
    required this.onSignInClick,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';

  bool get isEmailValid => email.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DevFestTopBar(
        title: 'DevFest',
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoAnimated(),

                Text(
                  'Entrar no DevFest',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(height: 24),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: isEmailValid
                        ? () => widget.onLoginClick(email)
                        : null,
                    child: const Text('Entrar'),
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem conta?'),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () => widget.onSignInClick(email),
                      child: const Text('Criar conta'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}