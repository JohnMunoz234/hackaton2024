import 'dart:async';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ScreenUtils {
  static double screenHeight(BuildContext context, {double percent = 0}) {
    return ScreenUtil().screenHeight * (percent / 100);
  }

  static double screenWidth(BuildContext context, {double percent = 0}) {
    return ScreenUtil().screenWidth * (percent / 100);
  }

  static Widget getIconBadge(BuildContext context, bool showBadge,
      {IconData iconData = Icons.notifications}) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 4, end: 7),
      badgeAnimation: const badges.BadgeAnimation.slide(
        // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        // curve: Curves.easeInCubic,
      ),
      badgeContent: SizedBox(
        width: 2.w,
        height: 2.h,
      ),
      showBadge: showBadge,
      badgeStyle: badges.BadgeStyle(
        badgeColor: const Color(0xFFFF0000),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  static Widget getWidgetBadge(
      {required BuildContext context,
        required bool showBadge,
        required Widget child,
        double top = -8,
        double end = -2}) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: top, end: end),
      badgeAnimation: const badges.BadgeAnimation.slide(
        // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        // curve: Curves.easeInCubic,
      ),
      badgeContent: const Text(' '),
      showBadge: showBadge,
      badgeStyle:   badges.BadgeStyle(
        badgeColor: const Color(0xFFFF0000),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }


}

class PreventDoubleClick {
  final int? blockedTime;
  Timer? _timer;

  PreventDoubleClick(
      {this.blockedTime = 500});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: blockedTime!), action);
  }
}
