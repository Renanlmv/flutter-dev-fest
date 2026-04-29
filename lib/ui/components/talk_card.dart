import 'package:devfest/model/talk.dart';
import 'package:devfest/ui/components/category_badge.dart';
import 'package:flutter/material.dart';

class TalkCard extends StatelessWidget {
  final Talk talk;
  final VoidCallback onClick;

  const TalkCard({
    super.key,
    required this.talk,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryBadge(category: talk.category),

              const SizedBox(height: 8),

              Text(
                talk.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 6),
                  Text(
                    talk.speaker,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 4),

              Row(
                children: [
                  const Icon(Icons.schedule),
                  const SizedBox(width: 6),
                  Text(
                    talk.time,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}