import 'package:devfest/model/talk.dart';
import 'package:devfest/model/talk_category.dart';

final List<Talk> devFestTalks = [
  Talk(
    id: 1,
    title: 'Jetpack Compose e o Futuro das UIs Android',
    speaker: 'Heider Lopes',
    time: '10:00',
    description:
        'Como o Jetpack Compose está mudando a forma como desenvolvemos interfaces para Android.',
    category: TalkCategory.android,
  ),
  Talk(
    id: 2,
    title: 'SwiftUI: Interfaces com Menos Código',
    speaker: 'Eric Brito',
    time: '11:00',
    description:
        'Como o SwiftUI tem revolucionado o desenvolvimento de interfaces no ecossistema Apple.',
    category: TalkCategory.ios,
  ),
  Talk(
    id: 3,
    title: 'Flutter Clean Architecture na Prática',
    speaker: 'Ricardo Ogliari',
    time: '12:00',
    description: 'Uma introdução prática à arquitetura limpa com Flutter e Dart.',
    category: TalkCategory.flutter,
  ),
  Talk(
    id: 4,
    title: 'Integração Flutter com Plataformas Nativas',
    speaker: 'Heider Lopes',
    time: '13:00',
    description:
        'Utilizando Platform Channels para acessar recursos Android e iOS no Flutter.',
    category: TalkCategory.flutter,
  ),
];