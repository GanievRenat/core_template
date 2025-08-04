import 'package:flutter/material.dart';

abstract class AppThemeColorScheme extends ColorScheme {
  const AppThemeColorScheme({
    required super.brightness,
    required this.white,
    required this.white75,
    required this.black,
    required this.black20,
    required this.ashGrey,
    required this.onAshGrey,
    required this.dairyCream,
    required this.grey,
    required this.ebony,
    required this.cloudBurst,
    required this.cloudBurst50,
    required this.slate,
    required this.dusk,
    required this.gold,
    required this.gold25,
    required this.budhaGold50,
    required this.darkGold,
    required this.orangeYellow,
    required this.lightGold,
    required this.goldenGrass,
    required this.brightGold,
    required this.goldDivider50,
    required this.red,
    required this.green,
    required this.carrotOrange,
    required this.blue,
    required this.windStar20,
    required this.lightGrey,
  }) : super(
         primary: Colors.black,
         secondary: Colors.black,
         surface: Colors.black,
         error: Colors.black,
         onPrimary: Colors.black,
         onSecondary: Colors.black,
         onSurface: Colors.white,
         onError: Colors.black,
       );

  final Color white;
  final Color white75;
  final Color black;
  final Color black20;
  final Color ashGrey;
  final Color onAshGrey;
  final Color dairyCream;
  final Color grey;
  final Color ebony;
  final Color slate;
  final Color cloudBurst;
  final Color cloudBurst50;
  final Color dusk;
  final Color gold;
  final Color gold25;
  final Color budhaGold50;
  final Color darkGold;
  final Color orangeYellow;
  final Color lightGold;
  final Color goldenGrass;
  final Color brightGold;
  final Color goldDivider50;
  final Color red;
  final Color green;
  final Color carrotOrange;
  final Color blue;
  final Color windStar20;
  final Color lightGrey;

  static LightColorScheme light = LightColorScheme();
  static DarkColorScheme dark = DarkColorScheme();
}

class LightColorScheme extends AppThemeColorScheme {
  LightColorScheme()
    : super(
        brightness: Brightness.light,
        white: Colors.white,
        white75: Colors.white.withValues(alpha: 0.75),
        black: Color(0XFF141418),
        black20: Colors.black.withValues(alpha: 0.2),
        gold: Color(0xFFFEA843),
        gold25: Color(0xFFFEA843).withValues(alpha: 0.25),
        budhaGold50: Color(0xFFFEA843).withValues(alpha: 0.5),
        lightGold: Color(0xFFFFC974),
        dairyCream: Color(0xFFFFE6C8),
        ashGrey: Color(0xFF33323A),
        onAshGrey: Color(0xFF7C798E),
        grey: Color(0xFF949494),
        ebony: Color(0xFF1C2848),
        cloudBurst: Color(0xFF1B2848),
        cloudBurst50: Color(0xFF1B2848).withValues(alpha: 0.5),
        slate: Color(0xFF4A596A),
        dusk: Color(0xFF47567D),
        darkGold: Color(0xFF9B3800),
        orangeYellow: Color(0xFFE4C03D),
        goldenGrass: Color(0xFFDDB72C),
        brightGold: Color(0xFFFFCE31),
        goldDivider50: Color(0xFFC39707).withValues(alpha: 0.5),
        red: Color(0xFFC91C1C),
        carrotOrange: Color(0xFFED9A1D),
        green: Color(0xFF29920F),
        blue: Color(0xFF5275B8),
        windStar20: Color(0xFF6C78B7).withValues(alpha: 0.2),
        lightGrey: Color(0xFFD2D2D2),
      );
}

class DarkColorScheme extends AppThemeColorScheme {
  DarkColorScheme()
    : super(
        brightness: Brightness.dark,
        white: Colors.white,
        white75: Colors.white.withValues(alpha: 0.75),
        black: Color(0XFF141418),
        black20: Colors.white.withValues(alpha: 0.2),
        ashGrey: Color(0xFF33323A),
        onAshGrey: Color(0xFF7C798E),
        dairyCream: Color(0xFFF0E5C1),
        lightGold: Color(0xFFFFC974),
        grey: Color(0xFF949494),
        ebony: Color(0xFF1C2848),
        cloudBurst: Color(0xFF1B2848),
        cloudBurst50: Color.fromARGB(255, 67, 69, 75).withValues(alpha: 0.5),
        slate: Color(0xFF4A596A),
        dusk: Color(0xFF47567D),
        gold: Color(0xFFCAA229),
        gold25: Color(0xFFCAA229).withValues(alpha: 0.25),
        budhaGold50: Color(0xFFC39707).withValues(alpha: 0.5),
        darkGold: Color(0xFF9B3800),
        orangeYellow: Color(0xFFE4C03D),
        goldenGrass: Color(0xFFDDB72C),
        brightGold: Color(0xFFFFCE31),
        goldDivider50: Color(0xFFC39707).withValues(alpha: 0.5),
        red: Color(0xFFC91C1C),
        carrotOrange: Color(0xFFED9A1D),
        green: Color(0xFF29920F),
        blue: Color(0xFF5275B8),
        windStar20: Color(0xFF6C78B7).withValues(alpha: 0.2),
        lightGrey: Color(0xFFD2D2D2),
      );
}

extension ColorFilterExtension on Color {
  ColorFilter get filter => ColorFilter.mode(this, BlendMode.srcIn);
}
