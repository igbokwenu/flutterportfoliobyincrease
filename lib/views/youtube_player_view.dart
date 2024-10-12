import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerView extends StatefulWidget {
  final String videoId;
  final String? title;

  const YoutubePlayerView({super.key, required this.videoId, this.title});

  @override
  YoutubePlayerViewState createState() => YoutubePlayerViewState();
}

class YoutubePlayerViewState extends State<YoutubePlayerView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Project Demo'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight *
                      0.8, // Limit height to 80% of screen
                  maxWidth: constraints.maxWidth,
                ),
                child: YoutubePlayerScaffold(
                  controller: _controller,
                  aspectRatio: 16 / 9,
                  builder: (context, player) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: player,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
