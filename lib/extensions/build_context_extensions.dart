import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:provider/provider.dart';

/// Extensions on [double] for convenience.
extension BuildContextExtensions on BuildContext {
  /// Subscribes to and  returns a scaled clamp of the current context's
  /// [ScrollController]'s full page scrolls.
  ///
  /// A shortcut for [ScrollControllerExtensions.fullPageScrollsOf] and then
  /// [DoubleExtensions.clampScaled].
  ///
  /// Unless [useSectionContext] is `false`, the offset of the current
  /// [PageSectionContext.pageIndex] is added to the [offset].
  double clampedPageScrolls({
    double offset = 0,
    double multiplier = 1,
    bool useSectionContext = true,
  }) {
    var effectiveOffset = offset;
    if (useSectionContext) {
      try {
        final index = select((PageSectionContext ctx) => ctx.pageIndex);
        effectiveOffset += index;
      } on ProviderNotFoundException {
        // Do nothing.
      }
    }

    return select(
      (ScrollController c) => c.fullPageScrollsOf(this).clampScaled(
            0,
            1,
            offset: effectiveOffset,
            multiplier: multiplier,
          ),
    );
  }
}
