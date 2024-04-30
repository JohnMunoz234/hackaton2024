import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/feature/launch/presentation/screen/splash_screen.dart';
import 'package:hackaton_2024_mv/feature/principal/presentation/screen/principal_screen.dart';
import 'package:hackaton_2024_mv/navigation/navigation_routes.dart';

abstract class BaseRoutes {
  static const String splash = '/splash';

  static final List<GoRoute> goRoutes = [
    GoRoute(
      path: splash,
      builder: (context, state) => SplashScreen(
        onFinish: (context) => context.go(PrincipalScreen.link),
      ),
    )
  ];
}
