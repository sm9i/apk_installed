import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ApkInstalled {
  static const MethodChannel _channel = const MethodChannel('apk_installed');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  ///判断apk 是否已经安装
  ///[package] 包名
  static Future<bool> isInstall({@required String package}) async {
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
