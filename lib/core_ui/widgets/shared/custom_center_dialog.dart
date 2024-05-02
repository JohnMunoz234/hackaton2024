import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_2024_mv/core/util/screen_util.dart';
import 'package:hackaton_2024_mv/resource/image_constants.dart';

import 'custom.main_button.dart';
import 'custom_secondary_button.dart';
import 'custom_sized_box_space.dart';

class CustomCenterDialog extends StatelessWidget {
  final String title;
  final String? imagePath;
  final String description;
  final List<Widget>? descriptionList;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final double? buttonsDistance;
  final VoidCallback? onPressedPrimary;
  final VoidCallback? onPressedSecondary;
  final VoidCallback? onCloseIconPressed;
  final bool? showCloseIcon;

  const CustomCenterDialog({
    super.key,
    required this.title,
    this.imagePath,
    required this.description,
    this.descriptionList,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.buttonsDistance = 0,
    this.onPressedPrimary,
    this.onPressedSecondary,
    this.onCloseIconPressed,
    this.showCloseIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      elevation: 0,
      backgroundColor: const Color(0xFFFFFFFF),
      child: Container(
        width: ScreenUtils.screenWidth(context, percent: 93),
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 24.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: SingleChildScrollView(child: _buildDialogContent(context)),
      ),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildTitle(context),
            ),
            if (showCloseIcon ?? false)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  onCloseIconPressed?.call();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      ImageConstants.icClose,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFDAE4E5),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const CustomSizedBoxSpace(
          heightPercent: 0,
        ),
        // TODO: HC 20240303 - Deshabilitar ilustración
        /*_buildImage(),*/
        description.isNotEmpty ? _buildDescription() : _buildDescriptionList(),
        _buildPrimaryButton(),
        CustomSizedBoxSpace(heightPercent: buttonsDistance),
        _buildSecondaryButton(),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      children: [
        const CustomSizedBoxSpace(heightPercent: 3),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            description,
            style: TextStyle(
              color: const Color(0xFFA3ADAE),
              fontSize: 16.sp,
              height: 1.2,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  _buildDescriptionList() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: descriptionList ?? [],
      ),
    );
  }

  Widget _buildPrimaryButton() {
    if (primaryButtonText?.isNotEmpty == true) {
      return Column(
        children: [
          const CustomSizedBoxSpace(heightPercent: 3),
          CustomMainButton(
              text: primaryButtonText!, onPressed: onPressedPrimary),
        ],
      );
    }
    return Container();
  }

  Widget _buildSecondaryButton() {
    if (secondaryButtonText?.isNotEmpty == true) {
      return Column(
        children: [
          const CustomSizedBoxSpace(heightPercent: 1),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomSecondaryButton(
                text: secondaryButtonText!,
                onPressed: onPressedSecondary,
              )),
        ],
      );
    }
    return Container();
  }
}
