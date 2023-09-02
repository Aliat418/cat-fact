part of '../light_theme.dart';

class _LightButtonThemeData extends AppButtonThemeData {
  const _LightButtonThemeData();

  @override
  ButtonStyle get common {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      backgroundColor: MaterialStateProperty.all(
        _AppColors.mainWhite,
      ),
      overlayColor: MaterialStateProperty.all(
        _AppColors.mainWhite,
      ),
    );
  }
}
