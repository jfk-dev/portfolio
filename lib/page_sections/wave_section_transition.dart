import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wave/config.dart' as wave;
import 'package:wave/wave.dart';

class WaveSectionTransition extends StatelessWidget {
  const WaveSectionTransition({
    super.key,
    this.height = 64,
    required this.fromColor,
    required this.toColor,
  });

  final double height;
  final Color fromColor;
  final Color toColor;

  /// Returns a duration in milliseconds based on the [fromColor] and [toColor].
  ///
  /// Value will be between 10 and 20 seconds.
  int get _duration {
    final fromColorValue = fromColor.value;
    final toColorValue = toColor.value;

    final random = Random(fromColorValue + toColorValue);

    const floor = 10000;
    const ceiling = 20000;

    return random.nextInt(ceiling - floor) + floor;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: height,
      color: fromColor,
      child: WaveWidget(
        size: Size(size.width, height),
        config: wave.CustomConfig(
          colors: [
            toColor,
          ],
          heightPercentages: [
            0.5,
          ],
          durations: [
            _duration,
          ],
        ),
      ),
    );
  }
}
