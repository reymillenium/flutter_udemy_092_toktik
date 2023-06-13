import 'package:flutter/material.dart';
import 'package:flutter_udemy_092_toktik/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videoPosts;

  const VideoScrollableView({super.key, required this.videoPosts});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.teal),
        Container(color: Colors.yellow),
        Container(color: Colors.pink),
        Container(color: Colors.deepPurple),
      ],
    );
  }
}
