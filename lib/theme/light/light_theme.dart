import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_theme.dart';

part 'src/button_theme.dart';
part 'src/color_theme.dart';
part 'src/constants.dart';
part 'src/text_theme.dart';
part 'src/theme_data.dart';

class LightThemeData extends AppThemeData {
  LightThemeData()
      : super(
          themeData: _createTheme(),
          textTheme: const _LightTextThemeData(),
          buttonTheme: const _LightButtonThemeData(),
          colorTheme: const _LightColorThemeData(),
        );
}
