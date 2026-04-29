import 'package:devfest/model/talk_category.dart';
import 'package:flutter/material.dart';

class CategoryBadge extends StatelessWidget {
  final TalkCategory category;

  const CategoryBadge({
    super.key,
    required this.category,
  });

  Color _getColor(TalkCategory category) {
    switch (category) {
      case TalkCategory.android:
        return const Color(0xFFA4C639);
      case TalkCategory.ios:
        return const Color(0xFFFA7343);
      case TalkCategory.flutter:
        return const Color(0xFF42A5F5);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(category);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        category.name.toUpperCase(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}