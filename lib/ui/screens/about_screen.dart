import 'package:devfest/ui/components/devfest_topbar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final VoidCallback onBackClick;

  const AboutScreen({
    super.key,
    required this.onBackClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DevFestTopBar(
        title: "Sobre",
        showBackButton: true,
        onBackClick: onBackClick,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O que é o Devfest?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 16),

            Text(
              "O DevFest é um evento de tecnologia com palestras, networking e conteúdos sobre desenvolvimento de software.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}