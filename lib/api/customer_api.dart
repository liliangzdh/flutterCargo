import 'package:cargo_flutter_app/model/app_response.dart';

import './base/dio_base.dart';

class CustomerApi {
  /// 获取 问题 咨询列表
  static Future<AppResponse> typeList({page, pageSize}) {
    return ApiManger.instance.sendRequest("customer/typeList", "post", {
      "size": pageSize,
      "start": page,
      "query": {},
    });
  }

  /// 获取问题详情 列表
  static Future<AppResponse> questionList({page, pageSize, id}) {
    return ApiManger.instance.sendRequest("customer/qList", "post", {
      "size": pageSize,
      "start": page,
      "query": {"id": id},
    });
  }
}
