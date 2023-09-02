// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:catfact_app/pages/fact_page/fact_page.dart' as _i1;
import 'package:catfact_app/pages/favorites_page/favorites_page.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    FactRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.FactPage(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoritesPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          FactRoute.name,
          path: '/fact-page',
        ),
        _i3.RouteConfig(
          FavoritesRoute.name,
          path: '/favorites-page',
        ),
      ];
}

/// generated route for
/// [_i1.FactPage]
class FactRoute extends _i3.PageRouteInfo<void> {
  const FactRoute()
      : super(
          FactRoute.name,
          path: '/fact-page',
        );

  static const String name = 'FactRoute';
}

/// generated route for
/// [_i2.FavoritesPage]
class FavoritesRoute extends _i3.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: '/favorites-page',
        );

  static const String name = 'FavoritesRoute';
}
