import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterportfoliobyincrease/main.dart';
import 'package:flutterportfoliobyincrease/utils/reusable_functions.dart';
import 'package:flutterportfoliobyincrease/views/youtube_player_view.dart';

class ProjectCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? webAppUrl;
  final String? videoUrl;
  final String? youtubeVideoId;
  final String? youtubeVideoTitle;

  const ProjectCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.webAppUrl,
    this.videoUrl,
    this.youtubeVideoId,
    this.youtubeVideoTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Container(
              color: isDarkMode
                  ? Colors.black.withOpacity(0.8)
                  : Colors.white.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(description),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (githubUrl != null)
                          _buildIconButton(FontAwesomeIcons.github, githubUrl!,
                              'View on GitHub'),
                        if (playStoreUrl != null)
                          _buildIconButton(FontAwesomeIcons.googlePlay,
                              playStoreUrl!, 'Download on Google Play'),
                        if (appStoreUrl != null)
                          _buildIconButton(FontAwesomeIcons.appStore,
                              appStoreUrl!, 'Download on App Store'),
                        if (webAppUrl != null)
                          _buildIconButton(FontAwesomeIcons.globe, webAppUrl!,
                              'Open Web App'),
                        if (videoUrl != null)
                          _buildIconButton(FontAwesomeIcons.youtube, videoUrl!,
                              'Watch Video'),
                        if (youtubeVideoId != null)
                          _buildYoutubeButton(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String url, String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(color: Colors.white),
      child: IconButton(
        icon: FaIcon(icon),
        onPressed: () => MyReusableFunctions.launchAnyUrl(url),
      ),
    );
  }

  Widget _buildYoutubeButton(BuildContext context) {
    return Tooltip(
      message: 'Watch on YouTube',
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(color: Colors.white),
      child: IconButton(
        icon: const FaIcon(FontAwesomeIcons.youtube),
        onPressed: () => _navigateToVideoPlayer(context),
      ),
    );
  }

  void _navigateToVideoPlayer(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => YoutubePlayerView(
          videoId: youtubeVideoId!,
          title: youtubeVideoTitle,
        ),
      ),
    );
  }
}
