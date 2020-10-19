/*
*
*
*
*
*
*/

import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtils {
  static final String tokenString = "Token";

  static saveToken(String token) async {
    var instance = await SharedPreferences.getInstance();
    instance.setString(tokenString, token);
  }

  static  getToken() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getString(tokenString);
  }
}
