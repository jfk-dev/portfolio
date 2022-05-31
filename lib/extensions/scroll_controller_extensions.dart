import 'package:flutter/material.dart';

/// Extensions on [ScrollController]s for convenience.
extension ScrollControllerExtensions on ScrollController {
  /// Retrieves the number of full pages that the [ScrollController] has
  /// scrolled, relative to the size of the [MediaQuery] of the given [context].
  double fullPageScrollsOf(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return offset / size.height;
  }
}
