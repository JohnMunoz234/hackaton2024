import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


const double _mainButtonHorizontalMargin = 0;
double _mainButtonRoundCorner = 4;

class CustomMainButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? colorText;
  final void Function()? onPressed;
  final EdgeInsetsGeometry margin;
  final bool showLoading;

  const CustomMainButton({
    super.key,
    required this.text,
    this.color = const Color(0xFF2499EF),
    this.colorText = Colors.black,
    this.onPressed,
    this.margin =
    const EdgeInsets.symmetric(horizontal: _mainButtonHorizontalMargin),
    this.showLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorButton = (onPressed != null) ? color : color?.withOpacity(0.30);
    return Container(
      width: double.infinity,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed != null
            ? () {
          onPressed!();
        }
            : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorButton),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_mainButtonRoundCorner),
            ),
          ),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0)),
        ),
        child:  Text(
          text.toLowerCase(),
          style: TextStyle(
              color: colorText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
      ),
    ),
    );
  }
}
