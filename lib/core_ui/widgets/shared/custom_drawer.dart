import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_2024_mv/core_ui/colors/color_constants.dart';
import 'package:hackaton_2024_mv/resource/image_constants.dart';

import 'custom_divider.dart';
import 'custom_sized_box_space.dart';

class CustomDrawer extends StatelessWidget {
  final int? selectedIndex;
  final Function(int) onItemTapped;
  final bool folderOrDocument;

  const CustomDrawer({
    super.key,
    required this.onItemTapped,
    required this.folderOrDocument,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  ColorConstants.primaryButtonColor,
      child: ListView(
        padding: EdgeInsets.only(left: 16.w),
        physics: const ClampingScrollPhysics(),
        children: [
          const CustomSizedBoxSpace(
            heightPercent: 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const CustomDivider(),
          ),
          _buildUnpairDeviceItem(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const CustomDivider(),
          ),
          const CustomSizedBoxSpace(
            heightPercent: 2,
          ),
          _buildLogoutItem(),
        ],
      ),
    );
  }



  _buildUnpairDeviceItem() {
    return ListTile(
      title: folderOrDocument ? const Text('Verificar documentos') : const Text('Verificar Carpeta'),
      textColor:  const Color(0xFFBEC8C9),
      onTap: () {
        onItemTapped.call(DrawerMenuScreensEnum.unpairDevice.index);
      },
    );
  }

  _buildLogoutItem() {
    return ListTile(
      title: const Text('Cerrar sesión'),
      leading: SvgPicture.asset(ImageConstants.icLogout),
      textColor: const Color(0xFFBEC8C9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: () {
        onItemTapped.call(DrawerMenuScreensEnum.logout.index);
      },
    );
  }
}

enum DrawerMenuScreensEnum {
  unpairDevice,
  logout,
}
