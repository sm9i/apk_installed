import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ApkInstalled {
  static const MethodChannel _channel = const MethodChannel('apk_installed');

  ///判断apk 是否已经安装
  ///[package] 包名
  static Future<bool> isInstall({@required String package}) async {
    if (Platform.isIOS || package == null || package.trim().isEmpty) {
      return false;
    }
    try {
      final bool isInstall = await _channel.invokeMethod<bool>(
        'getPackageIsInstalled',
        <String, String>{'package_name': package},
      );
      return isInstall;
    } on Exception catch (e) {
      debugPrint(e?.toString());
      return false;
    }
  }
}
