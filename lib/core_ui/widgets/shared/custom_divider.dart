import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final Color color;

  const CustomDivider({
    super.key,
    this.height = 2,
    this.color = const Color(0xFFDCE5F0),
  });

  @override
  Widget build(BuildContext context) {
    return Divider(height: height, color: color);
  }
}
