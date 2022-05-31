import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:provider/provider.dart';

/// Extensions on [double] for convenience.
extension BuildContextExtensions on BuildContext {
  /// Subscribes to and  returns a scaled clamp of the current context's
  /// [ScrollController]'s full page scrolls.
  ///
  /// A shortcut for [ScrollControllerExtensions.fullPageScrollsOf] and then
  /// [DoubleExtensions.clampScaled].
  double clampedPageScrolls({
    double offset = 0,
    double multiplier = 1,
  }) {
    return select(
      (ScrollController c) => c.fullPageScrollsOf(this).clampScaled(
            0,
            1,
            offset: offset,
            multiplier: multiplier,
          ),
    );
  }
}
