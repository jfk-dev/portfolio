/// Extensions on [double] for convenience.
extension DoubleExtensions on double {
  /// Clamps this value between [min] and [max].
  ///
  /// The [offset] allows for a custom offset to be applied to the value. This
  /// must be a positive integer of 0 or greater.
  ///
  /// The [multiplier] can be used to scale the value, meaning the [max] will
  /// be reached faster or slower.
  double clampScaled(
    double min,
    double max, {
    double offset = 0,
    double multiplier = 1,
  }) {
    assert(offset >= 0, 'offset must be greater than or equal to 0.');
    assert(multiplier >= 0, 'multiplier must be greater than or equal to 0.');

    return ((this - offset) * multiplier).clamp(min, max);
  }
}
