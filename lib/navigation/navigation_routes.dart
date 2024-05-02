import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/feature/auth/login/presentation/screen/login_screen.dart';
import 'package:hackaton_2024_mv/feature/document/presentation/screen/document_screen.dart';
import 'package:hackaton_2024_mv/feature/folder/presentation/screen/folders_screen.dart';
import 'package:hackaton_2024_mv/feature/principal/presentation/screen/principal_screen.dart';
import 'package:hackaton_2024_mv/navigation/authentication_router.dart';

abstract class NavigationRouters {
  static final List<GoRoute> goRoutes = [
    GoRoute(
      name: PrincipalScreen.name,
      path: PrincipalScreen.link,
      builder: (context, state) => PrincipalScreen(),
    ),
    GoRoute(
      name: FoldersScreen.name,
      path: FoldersScreen.link,
      builder: (context, state) => const FoldersScreen(),
    ),
    GoRoute(
      name: DocumentScreen.name,
      path: DocumentScreen.link,
      builder: (context, state) => const DocumentScreen(),
    ),
    GoRoute(
      name: LoginScreen.name,
      path: LoginScreen.link,
      builder: (context, state) => const LoginScreen(),
    )
  ];
}
