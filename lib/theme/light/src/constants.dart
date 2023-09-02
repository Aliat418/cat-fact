part of '../light_theme.dart';

const _headline26W5 = _TextStyle(
  26,
  FontWeight.w500,
  _AppColors.mainBlack,
);

const _headline22W4 = _TextStyle(
  22,
  FontWeight.w400,
  _AppColors.mainBlack,
);

const _headline18W6 = _TextStyle(
  18,
  FontWeight.w600,
  _AppColors.mainBlack,
);

const _headline18W5 = _TextStyle(
  18,
  FontWeight.w500,
  _AppColors.mainBlack,
);

const _headline16W5 = _TextStyle(
  16,
  FontWeight.w500,
  _AppColors.mainBlack,
);

class _TextStyle extends TextStyle {
  // ignore: use_super_parameters
  const _TextStyle(
    double size,
    FontWeight weight,
    Color color, {
    double? letterSpacing,
    String? fontFamily,
  }) : super(
          fontSize: size,
          fontWeight: weight,
          color: color,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
        );
}

abstract class _AppColors {
  static const Color mainRed = Color(0xFFA30000);
  static const Color mainBlack = Color(0xFF131313);
  static const Color mainLightGrey = Color(0xFF737373);
  static const Color mainWhite = Color(0xFFFFFFFF);
}
