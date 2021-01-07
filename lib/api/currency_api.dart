
import 'package:cargo_flutter_app/model/app_response.dart';

import 'base/dio_base.dart';


class CurrencyApi {
  /// 发送验证码
  static Future<AppResponse> sendCode(String mobile) {
    Map<String, dynamic> param = {
      "phone": mobile,
      "type": 2,
    };
    return ApiManger.instance.sendRequest("currency/sendCode", "post", param);
  }
}
