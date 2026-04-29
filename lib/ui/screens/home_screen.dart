import 'package:devfest/data/fake_data.dart';
import 'package:devfest/model/talk.dart';
import 'package:devfest/ui/components/devfest_topbar.dart';
import 'package:devfest/ui/components/talk_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  final VoidCallback onAboutClick;
  final ValueChanged<Talk> onSpeakerClick;
  final VoidCallback onLogoutClick;

  const HomeScreen({
    super.key,
    required this.email,
    required this.onAboutClick,
    required this.onSpeakerClick,
    required this.onLogoutClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DevFestTopBar(
        title: 'DevFest',
        actions: [
          IconButton(
            onPressed: onAboutClick,
            icon: const Icon(Icons.info),
            tooltip: 'Sobre',
          ),
          IconButton(
            onPressed: onLogoutClick,
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, $email',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 8),

            Text(
              'Bem-vindo ao app do DevFest.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.separated(
                itemCount: devFestTalks.length + 1,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Text(
                      'Palestras',
                      style: Theme.of(context).textTheme.titleLarge,
                    );
                  }

                  final talk = devFestTalks[index - 1];

                  return TalkCard(
                    talk: talk,
                    onClick: () => onSpeakerClick(talk),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}