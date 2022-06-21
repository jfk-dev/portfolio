import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/theme.dart';

export 'colors.dart';

abstract class PortfolioTheme {
  static ThemeData dark() {
    final base = ThemeData.dark();
    final baseTextTheme = GoogleFonts.firaSansTextTheme(base.textTheme);

    return base.copyWith(
      extensions: const [
        CustomColors.dark(),
      ],
      textTheme: baseTextTheme.copyWith(
        headlineLarge: baseTextTheme.headlineLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: baseTextTheme.headlineLarge!.color!.withOpacity(1),
        ),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
    );
  }
}
