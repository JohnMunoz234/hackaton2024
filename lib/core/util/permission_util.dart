import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackaton_2024_mv/core/util/dialog_util.dart';
import 'package:hackaton_2024_mv/core/util/parameters.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<bool> checkOrRequestPermission(
      BuildContext context) async {
    PermissionStatus status = await _handlerStoragePermission();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isRestricted || status.isLimited) {
      PermissionStatus newStatus;
          newStatus = await _handlerStoragePermission(requestPermission: true);
          if (newStatus.isGranted) {
            return true;
          } else {
            return false;
          }
    } else if (status.isPermanentlyDenied) {
      if (context.mounted) {
            DialogUtil.showMandatoryPermissionRequired(
                context);
      }
      return false;
    }
    return false;
  }

  static Future<PermissionStatus> _handlerStoragePermission({bool requestPermission = false}) async {
    PermissionStatus status;
    try {
      if (Platform.isAndroid) {
        status = await _handlerStorageAndroid(requestPermission: requestPermission);
      } else {
        status = requestPermission
            ? await Permission.mediaLibrary.request()
            : await Permission.mediaLibrary.status;
      }
    } catch (e) {
      status = PermissionStatus.permanentlyDenied;
    }
    return status;
  }
  static Future<PermissionStatus> _handlerStorageAndroid({bool requestPermission = false}) async {
    PermissionStatus status;
    try {
      AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt > Parameters.minSdkChange) {
        status = requestPermission
            ? await Permission.mediaLibrary.request()
            : await Permission.mediaLibrary.status;
      } else {
        status = requestPermission
            ? await Permission.storage.request()
            : await Permission.storage.status;
      }
    } catch (e) {
      status = PermissionStatus.permanentlyDenied;
    }
    return status;
  }
}
