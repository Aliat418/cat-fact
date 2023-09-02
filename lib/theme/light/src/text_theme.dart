part of '../light_theme.dart';

class _LightTextThemeData extends AppTextThemeData {
  const _LightTextThemeData();

  @override
  TextStyle get getCatFact {
    return _headline26W5.copyWith(
      color: _AppColors.mainBlack,
      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
    );
  }

  @override
  TextStyle get appBarTitle {
    return _headline18W6.copyWith(
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
  }

  @override
  TextStyle get factDate {
    return _headline18W5.copyWith(
        color: _AppColors.mainLightGrey,
        fontFamily: GoogleFonts.playfairDisplay().fontFamily);
  }

  @override
  TextStyle get fact {
    return _headline22W4.copyWith(
        fontFamily: GoogleFonts.playfairDisplay().fontFamily);
  }

  @override
  TextStyle get favoriteFactDate {
    return _headline16W5.copyWith(
        color: _AppColors.mainLightGrey,
        fontFamily: GoogleFonts.playfairDisplay().fontFamily);
  }

  @override
  TextStyle get favoriteFact {
    return _headline18W5.copyWith(
        fontFamily: GoogleFonts.playfairDisplay().fontFamily);
  }
}
