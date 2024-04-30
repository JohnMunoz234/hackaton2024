
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/feature/principal/presentation/screen/principal_screen.dart';

abstract class NavigationRouters {

  static final List<GoRoute> goRoutes = [
    GoRoute(
      name: PrincipalScreen.name,
      path: PrincipalScreen.link,
      builder: (context, state) => const PrincipalScreen(),
    )
  ];
}
