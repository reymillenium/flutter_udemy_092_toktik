import 'package:flutter/material.dart';
import 'package:flutter_udemy_092_toktik/presentation/providers/discover_provider.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.

    _controller = widget.videoUrl.isURL
        ? VideoPlayerController.network(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
          )
        : VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true);

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  void togglePlay(bool isPlaying) {
    // Wrap the play or pause in a call to `setState`. This ensures the
    // correct icon is shown.
    setState(() {
      // If the video is playing, pause it.
      // if (_controller.value.isPlaying) {
      if (isPlaying) {
        _controller.pause();
      } else {
        // If the video is paused, play it.
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>(); //New syntax
    togglePlay(discoverProvider.isPlaying);

    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: Stack(children: [
              VideoPlayer(_controller),
              //   Gradient
              //   Caption
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption),
              )
            ]),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: screenSize.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
