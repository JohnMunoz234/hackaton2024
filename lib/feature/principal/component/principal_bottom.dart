import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrincipalBottom extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const PrincipalBottom({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomAppBar(
        height: 45.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => navigationShell.goBranch(0),
              icon: const Icon(Icons.person),
              visualDensity: VisualDensity.compact,
            ),
            IconButton(
              onPressed: () => navigationShell.goBranch(0),
              icon: const Icon(Icons.list),
              visualDensity: VisualDensity.compact,
            ),
            IconButton(
              onPressed: () => navigationShell.goBranch(0),
              icon: const Icon(Icons.calendar_month),
              visualDensity: VisualDensity.compact,
            ),
            IconButton(
              onPressed: () => navigationShell.goBranch(0),
              icon: const Icon(Icons.settings),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
      ),
    );
  }
}