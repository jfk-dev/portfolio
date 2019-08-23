import 'package:flutter_web/material.dart';

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
  static const colorTextSecondary = Color(0xFF6E7380);
  static const colorTextTernary = Color(0xFF4A5574);
  
  static const colorBackgroundLight = Color(0xFF23222D);
  static const colorBackgroundDark = Color(0xFF15161E);

  static const colorRed = Color(0xFFF22D55);
  static const colorGreen = Color(0xFF29FFCA);

  static ThemeData theme() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: colorBackgroundDark,
      scaffoldBackgroundColor: colorBackgroundLight,
      primaryColor: colorBackgroundDark,
      accentColor: colorGreen,
      toggleableActiveColor: colorGreen,
      canvasColor: colorBackgroundLight,
      fontFamily: fontFamilyDefault,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        disabledColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
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
