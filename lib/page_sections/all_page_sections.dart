import 'package:flutter/material.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:provider/provider.dart';

class AllPageSections extends StatelessWidget {
  const AllPageSections({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final customColors = Theme.of(context).customColors;

    final colors = [
      customColors.purpleSecondary,
      customColors.pinkSecondary,
      customColors.blueSecondary,
      const Color(0xFF0C0D12),
      customColors.pinkSecondary,
    ];

    const sections = [
      IntroductionSection(),
      AppDevSection(),
      VgvSection(),
      MusicSection(),
      ContactSection(),
    ];

    return ListView(
      controller: context.read<ScrollController>(),
      children: [
        Provider(
          create: (_) => PageSectionContext(pageIndex: 0),
          child: const WaveWallpaper(),
        ),
        for (var i = 0; i < sections.length; i++)
          Provider(
            create: (_) => PageSectionContext(pageIndex: i + 1),
            child: Container(
              width: size.width,
              height: size.height,
              color: colors[i % colors.length],
              child: Stack(
                children: [
                  Positioned.fill(
                    child: sections[i],
                  ),
                  if (i != sections.length - 1)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: WaveSectionTransition(
                        fromColor: colors[i % colors.length],
                        toColor: colors[(i + 1) % colors.length],
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
