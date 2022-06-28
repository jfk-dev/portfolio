import 'package:flutter/material.dart';
import 'package:portfolio/hud/hud.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:portfolio/scroll_provider/scroll_provider.dart';
import 'package:portfolio/theme/theme.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollProvider(
      builder: (context) {
        return Scaffold(
          backgroundColor: Theme.of(context).customColors.pink,
          body: Stack(
            children: const [
              AllPageSections(),
              HudOverlay(),
            ],
          ),
        );
      },
    );
  }
}
