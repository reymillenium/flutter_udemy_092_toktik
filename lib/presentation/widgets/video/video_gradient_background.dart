import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

class VideoGradientBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const VideoGradientBackground({
    super.key,
    this.colors = const [Colors.transparent, Colors.black],
    this.stops = const [0.8, 1.0],
  }) : assert(colors.length == stops.length, 'Stops and Colors must have the same length');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: colors,
          stops: stops,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
      ),
    );
  }
}
