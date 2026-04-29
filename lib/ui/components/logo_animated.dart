import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoAnimated extends StatelessWidget {
  const LogoAnimated({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Lottie.asset(
        'assets/animations/splash_devfest.json',
        repeat: true,
        animate: true,
        fit: BoxFit.contain,
      ),
    );
  }
}