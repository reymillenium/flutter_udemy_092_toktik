import 'package:flutter/material.dart';
import 'package:flutter_udemy_092_toktik/domain/entities/video_post.dart';
import 'package:intl/intl.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;

  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: videoPost.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
          onPressed: () {},
        ),
        _CustomIconButton(
          value: videoPost.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color iconColor;

  final VoidCallback? onPressed;

  const _CustomIconButton({super.key, required this.value, required this.iconData, this.iconColor = Colors.white, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // final formatter = NumberFormat('#,###,000');
    final formatter = NumberFormat.compact(locale: "en_US", explicitSign: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          // onPressed: () {},
          onPressed: onPressed,
          disabledColor: iconColor,
          icon: Icon(
            iconData,
            size: 30,
          ),
          color: iconColor,
        ),
        Text(
          formatter.format(value),
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
