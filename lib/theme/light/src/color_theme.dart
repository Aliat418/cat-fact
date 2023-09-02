part of '../light_theme.dart';

class _LightColorThemeData extends AppColorThemeData {
  const _LightColorThemeData();

  @override
  Color get majorAccent {
    return _AppColors.mainRed;
  }

  @override
  Color get mainBackground {
    return _AppColors.mainWhite;
  }

  @override
  Color get heartIcon {
    return _AppColors.mainBlack;
  }
}
