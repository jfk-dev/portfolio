import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/resources/resources.dart';
import 'package:portfolio/widgets/widgets.dart';
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
    return AnimatedLogo(
      onTapLogo:
          _checkIsAtTopOfPage(context) ? null : () => _onTapLogo(context),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required this.onTapLogo,
  });

  final VoidCallback? onTapLogo;

  /// At what percentage of one full page scroll the logo should be placed at
  /// the top left of the screen.
  ///
  /// For example, a value of `0.5` means that if the user scrolls half a page,
  /// the logo will be placed at the top left of the screen.
  static const _logoCenteredOffsetPercentage = 0.5;

  /// The duration of all animations.
  static const _animationDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ScrollController>();
    final offsetT = controller.clampedPageScrollsOf(
      context,
      multiplier: 1 / _logoCenteredOffsetPercentage,
    );

    return AnimatedAlign(
      alignment: Alignment.lerp(Alignment.center, Alignment.topLeft, offsetT)!,
      curve: Curves.elasticOut,
      duration: _animationDuration,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ScaleButton(
            onTap: onTapLogo,
            child: Image.asset(
              Images.logo,
              width: lerpDouble(100, 50, offsetT),
            ),
          ),
        ),
      ),
    );
  }
}
