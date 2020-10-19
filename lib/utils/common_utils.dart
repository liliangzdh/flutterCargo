import 'dart:io';
import 'package:crypto/crypto.dart';

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
}
