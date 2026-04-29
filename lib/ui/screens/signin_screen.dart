import 'package:devfest/ui/components/devfest_topbar.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final String email;
  final ValueChanged<String> onCreateAccountClick;
  final VoidCallback onBackClick;

  const SignInScreen({
    super.key,
    required this.email,
    required this.onCreateAccountClick,
    required this.onBackClick,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController emailController;
  late final TextEditingController nameController;

  bool get canCreateAccount =>
      emailController.text.trim().isNotEmpty && nameController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nameController = TextEditingController();
  }

@override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DevFestTopBar(
        title: 'Criar conta',
        showBackButton: true,
        onBackClick: widget.onBackClick,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro DevFest',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(height: 24),

                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: canCreateAccount
                        ? () => widget.onCreateAccountClick(emailController.text)
                        : null,
                    child: const Text('Criar conta e entrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}