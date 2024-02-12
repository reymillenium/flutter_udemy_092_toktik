import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

class VideoButtons extends StatelessWidget {
  final VideoPostEntity videoPost;

  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.read<DiscoverProvider>(); //New syntax

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(width: 20),
        // _CustomIconButton(value: -1, iconData: Icons.play_circle_outline, onPressed: () {}),
        // BounceInDown(child:  _CustomIconButton(value: -1, iconData: Icons.play_circle_outline, onPressed: () {}) ),
        SpinPerfect(
          infinite: false,
          duration: const Duration(seconds: 1),
          child: _CustomIconButton(
              value: -1,
              iconData: discoverProvider.isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
              onPressed: () {
                discoverProvider.toggleVideoPlayer();
              }),
        ),
        // FadeInLeft(child:  _CustomIconButton(value: -1, iconData: Icons.play_circle_outline, onPressed: () {}) ),
        // FadeInUp(child: const Square() ),
        // FadeInDown(child: const Square() ),
        // FadeInRight(child: const Square() ),
      ],
    );
  }
}

class Square extends StatelessWidget {
  const Square({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blueAccent,
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
      mainAxisAlignment: MainAxisAlignment.center,
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
        if (value >= 0)
          Text(
            formatter.format(value),
            style: const TextStyle(fontSize: 10),
          ),
      ],
    );
  }
}
