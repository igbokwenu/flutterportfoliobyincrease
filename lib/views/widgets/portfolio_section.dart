import 'package:flutter/material.dart';
import 'package:flutterportfoliobyincrease/utils/constants/constants.dart';
import 'package:flutterportfoliobyincrease/views/widgets/projects_card.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProjectCard(
          imageUrl: anecdotalImageUrl,
          title: 'Anecdotal AI',
          description:
              'Rethinking healthcare: from profit-driven to patient-centric. Anecdotal AI closes the gap in literacy, diagnosis, and management of chronic illnesses using the power of AI.',
          appStoreUrl: anecdotalAppStoreUrl,
          youtubeVideoId: anecdotalYoutubeId,
          playStoreUrl: anecdotalPlayStoreUrl,
          webAppUrl: anecdotalWebAppUrl,
          youtubeVideoTitle: 'Anecdotal AI Demo Video',
        ),
        ProjectCard(
          imageUrl: habilisImageUrl,
          title: 'Habilis',
          description:
              'An AI enhanced marketplace reshaping how customers connect with skilled professionals.',
          appStoreUrl: habilisAppStoreUrl,
          youtubeVideoId: habilisYoutubeId,
          playStoreUrl: habilisPlayStoreUrl,
          youtubeVideoTitle: 'Habilis Demo Video',
        ),
        ProjectCard(
          imageUrl: scienceImageUrl,
          title: 'STEMify',
          description:
              'A basic science and online safety learning app for kids.',
          playStoreUrl: sciencePlayStoreUrl,
        ),
        ProjectCard(
          imageUrl: innosonImageUrl,
          title: 'IVM Showroom',
          description: 'An Automobile showroom app.',
          playStoreUrl: innosonPlayStoreUrl,
        ),
        ProjectCard(
          imageUrl: toonCardImageUrl,
          title: 'ToonCards',
          description:
              'An unfinished SwiftUI project for bringing cartoons to life using stories.',
          githubUrl: toonCardGitUrl,
        ),
      ],
    );
  }
}
