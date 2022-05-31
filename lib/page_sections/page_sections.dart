import 'package:flutter/material.dart';
import 'package:portfolio/page_sections/wave_wallpaper.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:provider/provider.dart';

class PageSections extends StatelessWidget {
  const PageSections({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final customColors = Theme.of(context).customColors;

    final colors = List.filled(3, [
      customColors.purpleSecondary,
      customColors.pinkSecondary,
      customColors.blueSecondary,
    ]).expand((e) => e);

    return ListView(
      controller: context.read<ScrollController>(),
      children: [
        const WaveWallpaper(),
        for (var i = 0; i < colors.length; i++)
          Container(
            width: size.width,
            height: size.height,
            color: colors.elementAt(i),
            child: Center(
              child: Text(
                'Page ${i + 1}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
      ],
    );
  }
}
