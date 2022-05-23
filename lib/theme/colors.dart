import 'package:flutter/material.dart';

/// {@template custom_colors}
/// A custom set of colors used for the portfolio app.
/// {@endtemplate}
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  /// {@macro custom_colors}
  const CustomColors({
    required this.pink,
    required this.purple,
    required this.blue,
  });

  /// The default set of light colors.
  const CustomColors.light()
      : this(
          pink: const Color(0xFFFF1778),
          purple: const Color(0xFF6B00AD),
          blue: const Color(0xFF00B6F2),
        );

  /// The default set of dark colors.
  ///
  /// Currently the same as the light colors.
  const CustomColors.dark()
      : this(
          pink: const Color(0xFFFF1778),
          purple: const Color(0xFF6B00AD),
          blue: const Color(0xFF00B6F2),
        );

  /// The shade of pink.
  ///
  /// Defaults to #FF1778.
  final Color pink;

  /// The shade of purple.
  ///
  /// Defaults to #6B00AD.
  final Color purple;

  /// The shade of blue.
  ///
  /// Defaults to #00B6F2.
  final Color blue;

  @override
  ThemeExtension<CustomColors> lerp(
    ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      pink: Color.lerp(pink, other.pink, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
    );
  }

  @override
  CustomColors copyWith({
    Color? pink,
    Color? purple,
    Color? blue,
  }) {
    return CustomColors(
      pink: pink ?? this.pink,
      purple: purple ?? this.purple,
      blue: blue ?? this.blue,
    );
  }

  @override
  String toString() =>
      'CustomColors(pink: $pink, purple: $purple, blue: $blue)';
}

/// Extensions on [ThemeData] for convenience.
extension CustomThemeDataExtensions on ThemeData {
  /// The set of colors used for the portfolio app.
  CustomColors get customColors => extension<CustomColors>()!;
}
