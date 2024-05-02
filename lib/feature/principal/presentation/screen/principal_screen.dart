import 'package:flutter/material.dart';

class PrincipalScreen extends StatelessWidget {
  static const String name = 'PrincipalScreen';
  static const String link = '/$name';

  final Function(BuildContext context) onNavLogin;

  const PrincipalScreen({
    super.key,
    required this.onNavLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Text("Hola a todos"),
            ElevatedButton(
              onPressed: () {
                onNavLogin.call(context);
              },
              child: const Text("Ir a Login"),
            )
          ],
        ),
      ),
    );
  }
}
