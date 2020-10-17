import 'package:cargo_flutter_app/model/app_response.dart';
import 'dart:io';
import './base/dio_base.dart';

class LoginApi {

  // 账户密码登录。
  static Future<AppResponse> accountLogin(String mobile, password) {
    Map<String, dynamic> param = {
      "phone": mobile,
      "password": password,
      "deviceType": Platform.isAndroid ? 'Android' : 'IOS',
      "clientType": "APP",
      "loginType":2,
      "rid":'',
    };
    return ApiManger.instance.sendRequest("user/login", "post", param);
  }
}
