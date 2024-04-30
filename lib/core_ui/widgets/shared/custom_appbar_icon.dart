import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbarIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final String assetName;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color? splashColor;
  final BorderRadius? borderRadius;
  final Color backgroundColor;

  const CustomAppbarIcon({
    super.key,
    this.onTap,
    required this.assetName,
    this.width = 16.0,
    this.height = 16.0,
    this.padding = const EdgeInsets.all(6.0),
    this.splashColor,
    this.borderRadius,
    this.backgroundColor = const Color(0x00ffffff),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(24),
        splashColor: splashColor ?? const Color(0xFFBEC8C9),
        child: Container(
          width: 32.w,
          height: 32.w,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(24),
            color: backgroundColor, // background
          ),
          child: SvgPicture.asset(
              assetName,
              width: width.w,
              height: height.h,
              colorFilter: const ColorFilter.mode(Color(0xFFBEC8C9), BlendMode.srcIn)
          ),
        ));
  }
}
