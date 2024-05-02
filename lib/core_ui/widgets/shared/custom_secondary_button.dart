import 'package:flutter/material.dart';
import 'package:hackaton_2024_mv/core/util/screen_util.dart';


const double _secondaryButtonHorizontalMargin = 0;
double _secondaryButtonRoundCorner = 4;

class CustomSecondaryButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color backgroundColor;
  final double horizontalMargin;
  final void Function()? onPressed;

  const CustomSecondaryButton(
      {super.key,
        required this.text,
        this.borderColor = const Color(0xFF2499EF),
        this.onPressed,
        this.backgroundColor = const Color(0xFFF5F8FA),
        this.horizontalMargin = _secondaryButtonHorizontalMargin});

  @override
  Widget build(BuildContext context) {
    final PreventDoubleClick preventDoubleClick = PreventDoubleClick();
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: OutlinedButton(
        onPressed: () {
          preventDoubleClick.run(() {
            if (onPressed != null) {
              onPressed!();
            }
          });
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(4.0),
          ),
          side: const BorderSide(color:Color(0xFF2499EF)),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text.toLowerCase(),
          style: const TextStyle(
              color:  Color(0xFF2499EF),
              fontSize: 16,
              fontWeight: FontWeight.w600)
        ),
      ),
    );
  }
}
