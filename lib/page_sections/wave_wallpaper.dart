import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart' as wave;
import 'package:wave/wave.dart';

class WaveWallpaper extends StatelessWidget {
  const WaveWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final customColors = Theme.of(context).customColors;
    final colors = [
      customColors.pink,
      customColors.blue,
      customColors.purpleSecondary,
    ];

    return Container(
      width: size.width,
      height: size.height,
      color: colors.first,
      child: WaveWidget(
        size: Size.infinite,
        config: wave.CustomConfig(
          colors: colors,
          heightPercentages: [
            0.0,
            0.3,
            0.7,
          ],
          durations: [
            0,
            10000,
            21000,
          ],
        ),
      ),
    );
  }
}