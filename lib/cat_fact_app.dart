import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'infrastructure/routing/router.gr.dart';
import 'theme/app_theme.dart';
import 'theme/light/light_theme.dart';

final _appRouter = AppRouter();

class CatFactApp extends StatelessWidget {
  const CatFactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: LightThemeData(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerDelegate: _appRouter.delegate(initialRoutes: [
              const FactRoute(),
            ]),
            routeInformationParser: _appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('en', ''),
            ],
            theme: AppTheme.of(context)?.themeData,
          );
        },
      ),
    );
  }
}
