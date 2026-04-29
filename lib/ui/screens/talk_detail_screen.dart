import 'package:devfest/model/talk.dart';
import 'package:devfest/model/talk_category.dart';
import 'package:devfest/ui/components/devfest_topbar.dart';
import 'package:flutter/material.dart';

class TalkDetailScreen extends StatelessWidget {
  final Talk? talk;
  final VoidCallback onBackClick;

  const TalkDetailScreen({
    super.key,
    required this.talk,
    required this.onBackClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DevFestTopBar(
        title: 'Detalhe',
        showBackButton: true,
        onBackClick: onBackClick,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: talk == null
            ? const Text('Nenhuma palestra encontrada')
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    talk!.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFC5CAE9),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          getCategoryIcon(talk!.category),
                          color: const Color(0xFF3F51B5),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            talk!.speaker,
                            style:
                                Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            talk!.time,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Descrição',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    talk!.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(height: 1.4),
                  ),

                  const Spacer(),
                ],
              ),
      ),
    );
  }
}

IconData getCategoryIcon(TalkCategory category) {
  switch (category) {
    case TalkCategory.android:
      return Icons.android;
    case TalkCategory.ios:
      return Icons.phone_iphone;
    case TalkCategory.flutter:
      return Icons.code;
  }
}