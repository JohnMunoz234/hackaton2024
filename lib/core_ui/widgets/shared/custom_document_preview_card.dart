import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackaton_2024_mv/core/util/skeleton_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'custom_sized_box_space.dart';

class CustomPreviewCardContent extends StatelessWidget {
  final String cardTitle;
  final bool? showAllView;
  final VoidCallback onViewAllTapped;
  final Widget content;

  const CustomPreviewCardContent({
    super.key,
    required this.cardTitle,
    required this.showAllView,
    required this.onViewAllTapped,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    var skeletonNotifier = cardTitle == 'Entidades'
        ? SkeletonUtils.skeletonEntitiesEnabledNotifier
        : SkeletonUtils.skeletonDocumentsEnabledNotifier;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 10,
            shadowColor: const Color(0x13507C0F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: ValueListenableBuilder<bool>(
                    valueListenable: skeletonNotifier,
                    builder: (context, skeletonEnabled, _) {
                      return Skeletonizer(
                        enabled: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cardTitle,
                              style: TextStyle(
                                  color: const Color(0xFF011E3D),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            showAllView ?? false
                                ? GestureDetector(
                                    onTap: onViewAllTapped,
                                    child: Text(
                                      'ver todo',
                                      style: TextStyle(
                                          color:  const Color(0xFF2499EF),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: content),
                ],
              ),
              const CustomSizedBoxSpace(
                heightPercent: 1,
              ),
            ])));
  }
}
