import 'package:flutter/widgets.dart';

abstract class WaveConfig {
  const WaveConfig();
}

class WaveConfigCustom extends WaveConfig {
  const WaveConfigCustom({
    this.colors,
    this.gradients,
    this.gradientBegin,
    this.gradientEnd,
    required this.durations,
    required this.heightPercentages,
    this.blur,
  })  : assert(
          colors != null || gradients != null,
          '`color or `gradients` must be provided.',
        ),
        assert(
          colors == null || gradients == null,
          'Cannot provide both colors and gradients.',
        ),
        assert(
          colors == null ||
              colors.length == durations.length &&
                  colors.length == heightPercentages.length,
          'Length of `colors`, `durations` and `heightPercentages` '
          'must be equal.',
        );

  final List<Color>? colors;
  final List<List<Color>>? gradients;
  final Alignment? gradientBegin;
  final Alignment? gradientEnd;
  final List<int> durations;
  final List<double> heightPercentages;
  final MaskFilter? blur;
}
