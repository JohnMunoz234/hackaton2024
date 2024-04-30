import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrincipalScreen extends StatelessWidget {
  static const String name = 'PrincipalScreen';
  static const String link = '/$name';

  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: SafeArea(
       child: Column(
         children: <Widget>[
           Text("Hola a todos")
         ],
       ),
     ),
    );
  }
}
