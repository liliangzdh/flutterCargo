import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

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

  /// 字符串是否为空或者 空字符串
  static isStringEmpty(String str) {
    return str == null || str.length == 0;
  }

  /// 是否是今天
  static bool isToday(String time) {
    DateTime endTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(time);
    final difference = endTime.difference(DateTime.now()).inDays;
    return difference == 0;
  }

  /// 是否是明天
  static bool isTomorrowDay(String time) {
    DateTime endTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(time);
    final difference = endTime.difference(DateTime.now()).inDays;
    return difference == 1;
  }

  static String formatCDate(String time) {
    DateTime endTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(time);
    if (DateTime.now().year == endTime.year) {
      return DateFormat('MM月dd日').format(endTime);
    }

    return DateFormat('yyyy年MM月dd日').format(endTime);
  }

  /// 筛选时间
  ///      * APP展示服务器返回的发货时间
  ///      * 0  精确的时间
  ///      * 1 凌晨：01:00---06:00
  ///      * 2 上午：07:00---12:00
  ///      * 3 下午：13:00---18:00
  ///      * 4 晚上：19:00---24:00
  ///      * 5 全天：00:00---24:00
  ///      * 6 今天或明天（eg:2020-7-15 00:00---2020-07-16 24:00）
  ///      * @param {选择时间数组} dateStr(eg:2020-07-18 09:30:00)
  ///
  static showServerDateTime(
      String predictSendTimeText, String predictSendTimeEnd) {
    try {
      if (isStringEmpty(predictSendTimeEnd) ||
          isStringEmpty(predictSendTimeText)) {
        return '';
      }
      print("------0000");
      DateTime endTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(predictSendTimeEnd);
      print("------121");
      final difference = endTime.difference(DateTime.now()).inDays;
      String sendDateStr;
      if (difference == 0) {
        sendDateStr = "今天";
      } else if (difference == 1) {
        sendDateStr = "明天";
      } else {
        sendDateStr = formatCDate(predictSendTimeEnd);
      }


      print("------3333:    $predictSendTimeText      $predictSendTimeEnd");
      var dateShowStr = '';
      switch (predictSendTimeText) {
        case "0":
          dateShowStr = predictSendTimeEnd;
          print("------3333");
          break;
        case "1":
          dateShowStr = sendDateStr + ' 凌晨 01:00-06:00';
          break;
        case "2":
          dateShowStr = sendDateStr + '上午 07:00-12:00';
          break;
        case "3":
          dateShowStr = sendDateStr + '下午：13:00-18:00';
          break;
        case "4":
          dateShowStr = sendDateStr + '晚上：19:00-24:00';
          break;
        case "5":
          dateShowStr = sendDateStr + '00:00---24:00';
          break;
        case "6":
          var yesterdayStr = "";
          if (isToday(predictSendTimeEnd)) {
            yesterdayStr = '今天';
          } else {
            yesterdayStr = formatCDate(predictSendTimeEnd);
          }

          if (isTomorrowDay(predictSendTimeEnd)) {
            sendDateStr = '明天';
          } else {
            sendDateStr = formatCDate(predictSendTimeEnd);
          }
          dateShowStr = yesterdayStr + '或' + sendDateStr + ' 00:00-24:00';
          break;
      }

      return dateShowStr;
    } catch (e) {
      print('--------ewer');
      return '';
    }
  }

  static Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('暂不支持打电话！');
    }
  }

  static phoneCall(String phoneNum){
    _makePhoneCall('tel:$phoneNum');
  }


  static isIphoneX(){
    return Device.get().isIphoneX;
  }

  // 是否 键盘展示。
  static bool isKeyboardShow(BuildContext context){
    return MediaQuery.of(context).viewInsets.vertical > 0;
  }

  static hideKeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
