import 'package:devfest/ui/components/logo_animated.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onNavigateToLogin;

  const SplashScreen({
    super.key,
    required this.onNavigateToLogin,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 6), () {
      widget.onNavigateToLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoAnimated(),
      ),
    );
  }
}