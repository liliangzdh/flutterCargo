import 'package:cargo_flutter_app/model/app_response.dart';
import './base/dio_base.dart';

class BillApi {
  /// 获取 账单 列表
  static Future<AppResponse> getBillList({page, pageSize}) {
    return ApiManger.instance.sendRequest("bill/spList", "post", {
      "size": pageSize,
      "start": page,
      "query":{},
    });
  }
}
