import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  final Function(BuildContext context) onFinish;

  const SplashScreen({
    super.key,
    required this.onFinish,
  });

  @override
  State<StatefulWidget> createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => widget.onFinish(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "hackaton 2024 mv",
          style: const TextStyle(
            fontSize: 32.0,
          ),
        ),
      ),
    );
  }
}