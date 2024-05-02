import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedBoxSpace extends StatelessWidget {
  final double? widthPercent;
  final double? heightPercent;
  final double? width;
  final double? height;

  const CustomSizedBoxSpace({
    Key? key,
    this.widthPercent,
    this.heightPercent,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? calculatedWidth = _calculateDimension(
      screenSize: ScreenUtil().screenWidth,
      percent: widthPercent,
      fixedSize: width?.w,
    );

    double? calculatedHeight = _calculateDimension(
      screenSize: ScreenUtil().screenHeight,
      percent: heightPercent,
      fixedSize: height?.h,
    );

    return SizedBox(
      width: calculatedWidth,
      height: calculatedHeight,
    );
  }

  double? _calculateDimension(
      {double? screenSize, double? percent, double? fixedSize}) {
    if (percent != null) {
      return screenSize! * (percent / 100);
    }
    return fixedSize;
  }
}
