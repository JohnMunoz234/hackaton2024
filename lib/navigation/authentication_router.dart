import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/feature/auth/login/presentation/screen/login_screen.dart';

abstract class AuthenticationRouter {
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  static final List<GoRoute> goRoutes = [
    GoRoute(
      path: login,
      builder: (context, state) => const LoginScreen(),
    ),
  ];
}