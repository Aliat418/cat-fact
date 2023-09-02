import 'package:flutter/material.dart';

part 'base/app_button_theme_data.dart';
part 'base/app_text_theme_data.dart';
part 'base/app_color_theme_data.dart';
part 'base/app_theme_data.dart';
part 'base/base_theme_data.dart';

class AppTheme extends InheritedWidget {
  static AppThemeData? of(BuildContext context) {
    return maybeOf(context)!;
  }

  static AppThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()?.theme;
  }

  static AppTextThemeData text(BuildContext context) {
    return of(context)!.textTheme;
  }

  static AppColorThemeData color(BuildContext context) {
    return of(context)!.colorTheme;
  }

  static AppButtonThemeData button(BuildContext context) {
    return of(context)!.buttonTheme;
  }

  final AppThemeData theme;

  const AppTheme({
    required this.theme,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}
