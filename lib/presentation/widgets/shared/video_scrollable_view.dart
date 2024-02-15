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
      // Important to make it work in Android
      physics: const BouncingScrollPhysics(),
      itemCount: videoPosts.length,
      itemBuilder: (context, index) {
        final VideoPostEntity videoPostEntity = videoPosts[index];

        return Stack(
          children: [
            // Video Player & Gradient
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: videoPostEntity.videoUrl,
                caption: videoPostEntity.caption,
              ),
            ),

            // Video Buttons
            Positioned(
              bottom: 56,
              right: 20,
              child: VideoButtons(videoPostEntity: videoPostEntity),
            )
          ],
        );
      },
    );
  }
}
