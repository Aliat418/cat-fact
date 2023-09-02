part of '../app_theme.dart';

class BaseThemeData<T extends AppTextThemeData, C extends AppColorThemeData,
    B extends AppButtonThemeData> {
  final ThemeData themeData;

  final T textTheme;

  final C colorTheme;

  final B buttonTheme;

  const BaseThemeData({
    required this.themeData,
    required this.textTheme,
    required this.colorTheme,
    required this.buttonTheme,
  });
}
