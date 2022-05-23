import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/theme.dart';

export 'colors.dart';

abstract class PortfolioTheme {
  static ThemeData light() {
    final base = ThemeData.light();
    return base.copyWith(
      extensions: const [
        CustomColors.light(),
      ],
      textTheme: GoogleFonts.firaSansTextTheme(base.textTheme),
    );
  }

  static ThemeData dark() {
    final base = ThemeData.dark();
    return base.copyWith(
      extensions: const [
        CustomColors.dark(),
      ],
      textTheme: GoogleFonts.firaSansTextTheme(base.textTheme),
    );
  }
}
