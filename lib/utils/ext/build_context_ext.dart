import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/app_theme.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
  AppButtonThemeData get buttonTheme => AppTheme.button(this);
  AppColorThemeData get colorTheme => AppTheme.color(this);
  AppTextThemeData get textTheme => AppTheme.text(this);
}
