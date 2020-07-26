import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const fontFamilyProductSans = 'Product Sans';
  static const fontFamilyFiraCode = 'Fira Code';
  static const fontFamilyDefault = fontFamilyProductSans;

  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightNormal = FontWeight.w400;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightBold = FontWeight.w700;

  static const colorTextPrimary = Colors.white;
  static const colorTextSecondary = Color(0xFFB7B9C0);
  static const colorTextTernary = Color(0xFF6E7380);

  static const colorBackgroundPrimary = Color(0xFF0C0D0F);
  static const colorBackgroundSecondary = Color(0xFF292D36);

  static const colorRed = Color(0xFFF22D55);
  static const colorGreen = Color(0xFF29FFCA);

  static const colorDefaultGradientOne = Colors.cyan;
  static const colorDefaultGradientTwo = colorGreen;
  static const gradientDefault = LinearGradient(
    colors: [colorDefaultGradientOne, colorDefaultGradientTwo],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const animationCurveDefault = Curves.fastLinearToSlowEaseIn;

  static ThemeData theme() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: colorBackgroundSecondary,
      scaffoldBackgroundColor: colorBackgroundPrimary,
      primaryColor: colorBackgroundSecondary,
      accentColor: colorGreen,
      toggleableActiveColor: colorGreen,
      canvasColor: colorBackgroundPrimary,
      cardColor: colorBackgroundSecondary,
      fontFamily: fontFamilyDefault,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.black,
        disabledColor: Colors.black,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        isDense: true,
        alignLabelWithHint: false,
      ),
    );
  }
}
