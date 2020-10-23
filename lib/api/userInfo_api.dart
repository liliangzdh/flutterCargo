import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'dart:io';
import './base/dio_base.dart';

class UserInfoApi {

  // 账户密码登录。
  static Future<AppResponse> getSpUser() {
    //  loginType 1 为货主端。2为 司机端。
    return ApiManger.instance.sendRequest("userInfo/getSpUser", "post", {});
  }
}
