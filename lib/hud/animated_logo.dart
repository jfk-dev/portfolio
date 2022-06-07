import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/resources/resources.dart';
import 'package:portfolio/widgets/widgets.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required this.onTapLogo,
  });

  /// Called when the logo is pressed;
  final VoidCallback? onTapLogo;

  /// At what percentage of one full page scroll the logo should be placed at
  /// the top left of the screen.
  static const _animationEndPoint = 0.5;

  /// The duration of all animations.
  static const _animationDuration = Duration(milliseconds: 500);

  /// The alignment of the logo when expanded.
  static const _expandedAlignment = Alignment(0, -0.3);

  /// The alignment of the logo when collapsed to the top.
  static const _collapsedAlignment = Alignment.topLeft;

  /// The size of the logo when fully expanded.
  static const _expandedLogoSize = Size.square(200);

  /// The size of the logo when fully collapsed to the top.
  static const _collapsedLogoSize = Size.square(50);

  @override
  Widget build(BuildContext context) {
    final offsetT = context.clampedPageScrolls(
      multiplier: 1 / _animationEndPoint,
    );

    final logoSize = Size.lerp(
      _expandedLogoSize,
      _collapsedLogoSize,
      offsetT,
    )!;

    return AnimatedAlign(
      alignment: Alignment.lerp(
        _expandedAlignment,
        _collapsedAlignment,
        offsetT,
      )!,
      curve: Curves.elasticOut,
      duration: _animationDuration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ScaleButton(
          hoverScaleFactor: 1.1,
          onTap: onTapLogo,
          child: Image.asset(
            Images.logo,
            width: logoSize.width,
            height: logoSize.height,
          ),
        ),
      ),
    );
  }
}
