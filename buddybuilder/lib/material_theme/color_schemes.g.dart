import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  // primary = theme for home
  brightness: Brightness.light,
  primary: Color(0xFF5C675C), // pillbuttoncolor 0xFFB7CEB7
  onPrimary: Color(0xFF191C19), // schrift allgemein
  primaryContainer: Color(0xFF5C675C), // pillbuttoncolor
  onPrimaryContainer: Color(0xFFFCFDF7), // pillbuttonschrift

  //
  secondary: Color(0xFF506352),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFB7CEB7), // containerbutton
  onSecondaryContainer: Color(0xFF0E1F12),
  tertiary: Color(0xFF3A656E),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBDEAF5),
  onTertiaryContainer: Color(0xFF001F25),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),

  background: Color(0xFFFFFFF7),
  onBackground: Color(0xFF191C19),
  surface: Color(0xFFFCFDF7),
  onSurface: Color(0xFF191C19),
  surfaceVariant: Color(0xFFDDE5DA),
  onSurfaceVariant: Color(0xFF414941),
  outline: Color(0xFF717970),
  onInverseSurface: Color(0xFFF0F1EC),
  inverseSurface: Color(0xFF2E312E),
  inversePrimary: Color(0xFF82D996),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF096D36),
  outlineVariant: Color(0xFFC1C9BF),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFB7CEB7),
  onPrimary: Color(0xFFFCFDF7), //
  primaryContainer: Color(0xFFB7CEB7), // pillbutton
  onPrimaryContainer: Color(0xFF191C19), // pillbuttonschrift
  secondary: Color(0xFFB7CCB7), // überschrift
  onSecondary: Color(0xFF233426),
  secondaryContainer: Color(0xFF394B3B), // containerbutton, appbarhintergrund
  onSecondaryContainer: Color(0xFFD3E8D2),
  tertiary: Color(0xFFA2CED8),
  onTertiary: Color(0xFF01363E),
  tertiaryContainer: Color(0xFF204D56),
  onTertiaryContainer: Color(0xFFBDEAF5),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C19), // background
  onBackground: Color(0xFFE2E3DE),
  surface: Color(0xFF191C19),
  onSurface: Color(0xFFFCFDF7), // color for calander pop up
  surfaceVariant: Color(0xFF414941),
  onSurfaceVariant: Color(0xFFC1C9BF),
  outline: Color(0xFF8B938A),
  onInverseSurface: Color(0xFF191C19),
  inverseSurface: Color(0xFFE2E3DE),
  inversePrimary: Color(0xFF096D36),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF82D996),
  outlineVariant: Color(0xFF414941),
  scrim: Color(0xFF000000),
);
