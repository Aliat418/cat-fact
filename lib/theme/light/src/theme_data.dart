part of '../light_theme.dart';

ThemeData _createTheme() {
  const textTheme = TextTheme(
    headlineMedium: _headline26W5,
    titleLarge: _headline18W6,
    labelLarge: _headline18W5,
    bodyLarge: _headline16W5,
  );

  final textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _AppColors.mainWhite,
      backgroundColor: _AppColors.mainWhite,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
  );

  final themeData = ThemeData(
    textTheme: textTheme,
    textButtonTheme: textButtonThemeData,
  );

  return themeData;
}
