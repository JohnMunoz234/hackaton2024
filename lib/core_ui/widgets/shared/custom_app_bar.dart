import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackaton_2024_mv/resource/color_constants.dart';
import 'package:hackaton_2024_mv/resource/image_constants.dart';

import 'custom_appbar_icon.dart';
import 'custom_sized_box_space.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final String? icon;
  final List<Widget> actions;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final bool forceMaterialTransparency;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.icon,
    this.actions = const [],
    this.onTap,
    this.backgroundColor = ColorConstants.primaryBackgroundColor,
    this.forceMaterialTransparency = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> actionWidgets = actions
        .map((action) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                action,
                CustomSizedBoxSpace(width: 16.w),
              ],
            ))
        .toList();
    Widget widgetTitle = Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          title ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Colors.white
          ),
        ));
    return AppBar(
      forceMaterialTransparency: forceMaterialTransparency,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      actions: [
        CustomSizedBoxSpace(width: 16.w),

        title != null ? Expanded(child: widgetTitle) : const SizedBox.shrink(),
        if (title == null) Expanded(child: Container()),
        ...actionWidgets,
        Builder(
            builder: (context) => CustomAppbarIcon(
              assetName: icon ?? "",
              onTap: onTap,
            )),
        CustomSizedBoxSpace(width: 20.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
