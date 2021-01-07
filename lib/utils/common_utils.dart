import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';

class CommonUtils {
  static isIos() {
    return Platform.isIOS;
  }

  static isAndroid() {
    return Platform.isAndroid;
  }

  //md5 加密
  static md5Encryption(String str) {
    return md5.convert(str.codeUnits).toString();
  }

  /// 获取屏幕 宽度
  static double getScreenWidth(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return mq.size.width;
  }
}
