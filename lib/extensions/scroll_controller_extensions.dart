import 'package:flutter/material.dart';

/// Extensions on [ScrollController]s for convenience.
extension ScrollControllerX on ScrollController {
  /// Retrieves the number of full pages that the [ScrollController] has
  /// scrolled, relative to the size of the [MediaQuery] of the given [context].
  double fullPageScrollsOf(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return offset / size.height;
  }

  /// Returns the clamped number of page scrolls that the [ScrollController] has
  /// scrolled between 0.0 and 1.0.
  ///
  /// This is useful for animating parts of the UI based on the current scroll
  /// position.
  ///
  /// The [offset] allows for a custom offset to be applied to the value. This
  /// must be a positive integer of 0 or greater.
  ///
  /// The [multiplier] can be used to scale the value, meaning the 1.0 mark will
  /// be reached faster or slower.
  ///
  /// ```dart
  /// // When half a page is scrolled (i.e., 0.5).
  /// clampedPageScrollsOf(context); // 0.5
  /// clampedPageScrollsOf(context, multiplier: 2.0) // 1.0
  /// clampPageScrollsOf(context, offset: 0.5) // 0.0
  /// ```
  double clampedPageScrollsOf(
    BuildContext context, {
    double offset = 0,
    double multiplier = 1,
  }) {
    assert(offset >= 0, 'Offset must be greater than or equal to 0.');
    assert(multiplier >= 0, 'Multiplier must be greater than or equal to 0.');

    return ((fullPageScrollsOf(context) - offset) * multiplier).clamp(0.0, 1.0);
  }
}
