
import 'package:devfest/model/talk_category.dart';

class Talk {
  final int id;
  final String title;
  final String speaker;
  final String time;
  final String description;
  final TalkCategory category;

  Talk({
    required this.id,
    required this.title,
    required this.speaker,
    required this.time,
    required this.description,
    required this.category,
  });
}