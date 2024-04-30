import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/navigation/base_routers.dart';
import 'package:hackaton_2024_mv/navigation/nav_keys.dart';
import 'package:hackaton_2024_mv/navigation/navigation_routes.dart';

class RouterNav {
  GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: BaseRoutes.splash,
    navigatorKey: NavKeys.rootNavKey,
    routes: <RouteBase>[
      ...BaseRoutes.goRoutes,
      ...NavigationRouters.goRoutes,
    ],
  );
}
