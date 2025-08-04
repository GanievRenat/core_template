import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class AppTheme {
  AppTheme({
    required this.color,
    required this.textStyle,
    required this.themeData,
    required this.shadow,
  });

  static AppTheme darkTheme = AppTheme.initializeTheme(
    colorScheme: AppThemeColorScheme.dark,
    baseThemeData: ThemeData.dark(),
  );

  static AppTheme lightTheme = AppTheme.initializeTheme(
    colorScheme: AppThemeColorScheme.light,
    baseThemeData: ThemeData.light(),
  );

  static Iterable<AppTheme> themes = [lightTheme, darkTheme];

  bool get isDark => this == darkTheme;

  static AppTheme of(BuildContext context) {
    final brightness =
        MediaQueryData.fromView(View.of(context)).platformBrightness;
    return brightness == Brightness.dark
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;
  }

  final AppThemeColorScheme color;
  final AppTextTheme textStyle;
  final ThemeData themeData;
  final AppShadow shadow;

  static ThemeData _createBaseThemeData(
    AppThemeColorScheme colorScheme,
    AppTextTheme textTheme,
    ThemeData baseThemeData,
  ) => baseThemeData.copyWith(
    unselectedWidgetColor: colorScheme.white,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: colorScheme.black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: colorScheme.black,
      foregroundColor: colorScheme.white,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFF001D6B)),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: colorScheme.ashGrey,
      labelStyle: TextStyle(
        fontFamily: 'Roboto',
        color: colorScheme.onAshGrey,
        fontSize: 12,
      ),
      elevation: 0,
      padding: EdgeInsets.zero,
      side: BorderSide.none,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontFamily: 'Roboto'),
      bodyMedium: TextStyle(fontFamily: 'Roboto'),
      bodySmall: TextStyle(fontFamily: 'Roboto'),
      displayLarge: TextStyle(fontFamily: 'Roboto'),
      displayMedium: TextStyle(fontFamily: 'Roboto'),
      displaySmall: TextStyle(fontFamily: 'Roboto'),
      headlineLarge: TextStyle(fontFamily: 'Roboto'),
      headlineMedium: TextStyle(fontFamily: 'Roboto'),
      headlineSmall: TextStyle(fontFamily: 'Roboto'),
      labelLarge: TextStyle(fontFamily: 'Roboto'),
      labelMedium: TextStyle(fontFamily: 'Roboto'),
      labelSmall: TextStyle(fontFamily: 'Roboto'),
      titleLarge: TextStyle(fontFamily: 'Roboto'),
      titleMedium: TextStyle(fontFamily: 'Roboto'),
      titleSmall: TextStyle(fontFamily: 'Roboto'),
    ),
    pageTransitionsTheme:
        kIsWeb
            ? null
            : const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
    switchTheme: SwitchThemeData(
      trackOutlineWidth: WidgetStatePropertyAll(1),
      trackOutlineColor: WidgetStateColor.resolveWith((states) {
        return colorScheme.gold;
      }),
      thumbColor: WidgetStateColor.resolveWith((states) {
        return colorScheme.gold;
      }),
      trackColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.darkGold;
        }
        return colorScheme.black;
      }),
    ),
  );

  factory AppTheme.initializeTheme({
    required AppThemeColorScheme colorScheme,
    required ThemeData baseThemeData,
  }) {
    final textTheme = AppTextTheme.byColorScheme(colorScheme);

    return AppTheme(
      color: colorScheme,
      themeData: _createBaseThemeData(colorScheme, textTheme, baseThemeData),
      textStyle: textTheme,
      shadow: AppShadow.byColorScheme(colorScheme: colorScheme),
    );
  }
}
