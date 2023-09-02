import 'package:auto_route/auto_route.dart';

import '/pages/fact_page/fact_page.dart';
import '/pages/favorites_page/favorites_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: FactPage),
    AutoRoute(page: FavoritesPage),
  ],
)
class $AppRouter {}
