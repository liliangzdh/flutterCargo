import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'dart:io';
import './base/dio_base.dart';

class LoginApi {

  // 账户密码登录。
  static Future<AppResponse> accountLogin(String mobile, password) {
    //  loginType 1 为货主端。2为 司机端。
    Map<String, dynamic> param = {
      "phone": mobile,
      "password": CommonUtils.md5Encryption(password),
      "deviceType": Platform.isAndroid ? 'Android' : 'IOS',
      "clientType": "APP",
      "loginType":1,
      "rid":'',
    };
    return ApiManger.instance.sendRequest("user/login", "post", param);
  }
}
