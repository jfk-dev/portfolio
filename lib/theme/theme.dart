import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

export 'colors.dart';

abstract class PortfolioTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      extensions: const [
        CustomColors.light(),
      ],
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      extensions: const [
        CustomColors.dark(),
      ],
    );
  }
}
