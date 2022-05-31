import 'package:flutter/material.dart';

/// {@template custom_colors}
/// A custom set of colors used for the portfolio app.
/// {@endtemplate}
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  /// {@macro custom_colors}
  const CustomColors({
    required this.pink,
    required this.pinkSecondary,
    required this.purple,
    required this.purpleSecondary,
    required this.blue,
    required this.blueSecondary,
  });

  /// The default set of light colors.
  const CustomColors.light()
      : this(
          pink: const Color(0xFFFF1778),
          pinkSecondary: const Color(0xFFCC0A5A),
          purple: const Color(0xFF6B00AD),
          purpleSecondary: const Color(0xFF3D0073),
          blue: const Color(0xFF00B6F2),
          blueSecondary: const Color(0xFF0073C7),
        );

  /// The default set of dark colors.
  ///
  /// Currently the same as the light colors.
  const CustomColors.dark()
      : this(
          pink: const Color(0xFFFF1778),
          pinkSecondary: const Color(0xFFCC0A5A),
          purple: const Color(0xFF6B00AD),
          purpleSecondary: const Color(0xFF3D0073),
          blue: const Color(0xFF00B6F2),
          blueSecondary: const Color(0xFF0073C7),
        );

  /// The shade of pink.
  ///
  /// Defaults to #FF1778.
  final Color pink;

  /// The secondary shade of pink, usually darker.
  ///
  /// Defaults to #CC0A5A.
  final Color pinkSecondary;

  /// The shade of purple.
  ///
  /// Defaults to #6B00AD.
  final Color purple;

  /// The secondary shade of purple, usually darker.
  ///
  /// Defaults to #3D0073.
  final Color purpleSecondary;

  /// The shade of blue.
  ///
  /// Defaults to #00B6F2.
  final Color blue;

  /// The secondary shade of blue, usually darker.
  ///
  /// Defaults to #0073C7.
  final Color blueSecondary;

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
      pinkSecondary: Color.lerp(pinkSecondary, other.pinkSecondary, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      purpleSecondary: Color.lerp(purpleSecondary, other.purpleSecondary, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      blueSecondary: Color.lerp(blueSecondary, other.blueSecondary, t)!,
    );
  }

  @override
  CustomColors copyWith({
    Color? pink,
    Color? pinkSecondary,
    Color? purple,
    Color? purpleSecondary,
    Color? blue,
    Color? blueSecondary,
  }) {
    return CustomColors(
      pink: pink ?? this.pink,
      pinkSecondary: pinkSecondary ?? this.pinkSecondary,
      purple: purple ?? this.purple,
      purpleSecondary: purpleSecondary ?? this.purpleSecondary,
      blue: blue ?? this.blue,
      blueSecondary: blueSecondary ?? this.blueSecondary,
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
