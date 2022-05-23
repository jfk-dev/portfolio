import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:provider/provider.dart';

class HudOverlay extends StatelessWidget {
  const HudOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimatedLogo();
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key});

  /// The offset indicating the top left of the screen.
  static const topLeft = Offset.zero;

  /// At what percentage of one full page scroll the logo should be placed at
  /// the top left of the screen.
  ///
  /// For example, a value of `0.5` means that if the user scrolls half a page,
  /// the logo will be placed at the top left of the screen.
  static const logoCenteredOffsetPercentage = 0.5;

  /// The width of the center logo.
  static const logoWidth = 100.0;

  /// The height of the center logo.
  static const logoHeight = 100.0;

  Offset lerpOffset(
    Offset begin,
    Offset end,
    double t, {
    Curve curve = Curves.linear,
  }) {
    var effectiveCurve = curve;
    if (begin > end) {
      effectiveCurve = effectiveCurve.flipped;
    }
    final minX = math.min(begin.dx, end.dx);
    final maxX = math.max(begin.dx, end.dx);
    final interpolatedX = begin.dx + (end.dx - begin.dx) * t;

    /// The X-component normalized to be between 0.0 and 1.0.
    final normalizedX = (interpolatedX - minX) / (maxX - minX);
    final curvedX = effectiveCurve.transform(normalizedX) * (maxX - minX);

    final minY = math.min(begin.dy, end.dy);
    final maxY = math.max(begin.dy, end.dy);
    final interpolatedY = begin.dy + (end.dy - begin.dy) * t;

    /// The Y-component normalized to be between 0.0 and 1.0.
    final normalizedY = (interpolatedY - minY) / (maxY - minY);
    final curvedY = effectiveCurve.transform(normalizedY) * (maxY - minY);

    return Offset(
      curvedX,
      curvedY,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final controller = context.watch<ScrollController>();
    final offset = controller.offset;

    final fullPagesScrolled = controller.offset / size.height;
    final offsetT =
        (fullPagesScrolled / logoCenteredOffsetPercentage).clamp(0.0, 1.0);

    final screenCenter = size.center(Offset.zero);
    final logoCenter = Offset(
      screenCenter.dx - (logoWidth / 2),
      screenCenter.dy - (logoHeight / 2),
    );

    final logoOffset = lerpOffset(
      logoCenter,
      topLeft,
      offsetT,
      curve: Curves.easeInOut,
    );

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.elasticOut,
      left: logoOffset.dx,
      top: logoOffset.dy,
      child: Container(
        width: logoWidth,
        height: logoHeight,
        padding: const EdgeInsets.all(8),
        child: FlutterLogo(
          style: FlutterLogoStyle.stacked,
          textColor: Theme.of(context).customColors.pink,
        ),
      ),
    );
  }
}
