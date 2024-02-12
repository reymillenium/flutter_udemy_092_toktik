import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPostEntity> videoPosts;

  const VideoScrollableView({super.key, required this.videoPosts});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videoPosts.length,
      itemBuilder: (context, index) {
        final VideoPostEntity videoPost = videoPosts[index];

        return Stack(
          children: [
            // Video Player
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
              ),
            ),
            // Gradient
            // Video Buttons
            Positioned(
              bottom: 56,
              right: 20,
              child: VideoButtons(videoPost: videoPost),
            )
          ],
        );
      },
    );
  }
}
