
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_center_dialog.dart';
import 'package:hackaton_2024_mv/core_ui/widgets/shared/custom_sized_box_space.dart';

class DialogUtil {

  static void showCustomDialog({
    required BuildContext context,
    required String title,
    required String description,
    List<Widget>? descriptionList,
    String? imagePath,
    bool isCancelable = true,
    double? buttonsDistance = 0,
    EdgeInsetsGeometry? titlePadding,
    String? primaryButtonText,
    String? secondaryButtonText,
    String? labelTextDropdown,
    VoidCallback? onPressedPrimaryButton,
    VoidCallback? onPressedSecondaryButton,
    VoidCallback? onCloseIconPressed,
    bool showCloseIcon = false,
  }) {
    Widget dialog = _getDialogBasedOnType(
      title: title,
      description: description,
      descriptionList: descriptionList,
      imagePath: imagePath,
      labelTextDropdown: labelTextDropdown,
      primaryButtonText: primaryButtonText?.toLowerCase(),
      secondaryButtonText: secondaryButtonText?.toLowerCase(),
      onPressedPrimaryButton: onPressedPrimaryButton,
      onPressedSecondaryButton: onPressedSecondaryButton,
      onCloseIconPressed: onCloseIconPressed,
      showCloseIcon: showCloseIcon,
    );
    showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (BuildContext context) {
        return WillPopScope(
          child: dialog,
          onWillPop: () async {
            return isCancelable;
          },
        );
      },
    );
  }

  static void showMandatoryPermissionRequired(BuildContext context) {
    return showCustomDialog(
        context: context,
        title: 'No podemos continuar',
        imagePath: Icons.add_alert.fontPackage,
        description: "",
        descriptionList: [
          const CustomSizedBoxSpace(widthPercent: 100, heightPercent: 2),
          Text('Para continuar con esta acción es necesario que nos brindes acceso a tu almacenamiento, puedes ir a:',
            textAlign: TextAlign.center,
          ),
          const CustomSizedBoxSpace(widthPercent: 100, heightPercent: 2),
          Text(
            'trueID > permisos > almacenamiento',
          )
        ],
        primaryButtonText: "Ir a configuraciones",
        showCloseIcon: true,
        onPressedPrimaryButton: () async {
          FocusScope.of(context).unfocus();
            if (context.mounted) {
              context.pop();
            }
        },
        onCloseIconPressed: () {
          if (context.mounted) {
            context.pop();
          }
        });
  }
  static Widget _getDialogBasedOnType({
    required String title,
    required String description,
    String? imagePath,
    List<Widget>? descriptionList,
    String? primaryButtonText,
    String? secondaryButtonText,
    String? labelTextDropdown,
    VoidCallback? onPressedPrimaryButton,
    VoidCallback? onPressedSecondaryButton,
    VoidCallback? onCloseIconPressed,
    bool showCloseIcon = false,
  }) {
    return CustomCenterDialog(
          title: title,
          imagePath: imagePath,
          description: description,
          descriptionList: descriptionList,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onPressedPrimary: onPressedPrimaryButton,
          onPressedSecondary: onPressedSecondaryButton,
          onCloseIconPressed: onCloseIconPressed,
          showCloseIcon: showCloseIcon,
        );

  }
}