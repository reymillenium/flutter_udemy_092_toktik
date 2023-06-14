import 'package:flutter/material.dart';
import 'package:flutter_udemy_092_toktik/domain/entities/video_post.dart';
import 'package:flutter_udemy_092_toktik/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videoPosts;

  const VideoScrollableView({super.key, required this.videoPosts});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videoPosts.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videoPosts[index];
        return Stack(
          children: [
            // Video Player
            // Gradient
            // Video Buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(videoPost: videoPost),
            )
          ],
        );
      },
    );
  }
}
