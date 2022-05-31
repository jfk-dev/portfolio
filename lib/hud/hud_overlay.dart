import 'package:flutter/material.dart';
import 'package:portfolio/hud/hud.dart';
import 'package:provider/provider.dart';

class HudOverlay extends StatelessWidget {
  const HudOverlay({super.key});

  bool _checkIsAtTopOfPage(BuildContext context) {
    return context
        .select((ScrollController c) => c.offset == c.initialScrollOffset);
  }

  void _onTapLogo(BuildContext context) {
    final controller = context.read<ScrollController>();
    controller.animateTo(
      controller.initialScrollOffset,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutCubicEmphasized,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedLogo(
          onTapLogo:
              _checkIsAtTopOfPage(context) ? null : () => _onTapLogo(context),
        ),
        const AnimatedSocialIcons(),
      ],
    );
  }
}
