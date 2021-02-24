/*
*
*
*
*
*
*/

import 'package:cargo_flutter_app/model/goods_type_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cargo_flutter_app/model/user_info_entity.dart';
import 'dart:convert' as JSON;

class SharePreferenceUtils {
  static final String tokenString = "Token";
  static final String userInfoKey = "UserInfo";
  static final String historyGoodInfoList = "historyGoodInfoList";

  static saveToken(String token) async {
    var instance = await SharedPreferences.getInstance();
    instance.setString(tokenString, token);
  }

  static getToken() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getString(tokenString);
  }

  static saveUserInfo(Map<String, dynamic> userInfoStr) async {
    var instance = await SharedPreferences.getInstance();
    instance.setString(userInfoKey, JSON.jsonEncode(userInfoStr));
  }

  static getUserInfo() async {
    var instance = await SharedPreferences.getInstance();
    var string = instance.getString(userInfoKey);
    if (string == null || string.length == 0) {
      return null;
    }
    return UserInfoEntity().fromJson(JSON.jsonDecode(string));
  }

  static saveHistoryGoodInfoList(List<GoodsTypeEntity> list) async {
    var instance = await SharedPreferences.getInstance();
    instance.setString(historyGoodInfoList, JSON.jsonEncode(list));
  }

  static Future<List<GoodsTypeEntity>> getHistoryGoodInfoList() async {
    var instance = await SharedPreferences.getInstance();
    var string = instance.getString(historyGoodInfoList);
    if (string == null || string.length == 0) {
      return [];
    }
    List<dynamic> list = JSON.jsonDecode(string);
    return list
        .map<GoodsTypeEntity>((e) => GoodsTypeEntity().fromJson(e))
        .toList();
  }
}
