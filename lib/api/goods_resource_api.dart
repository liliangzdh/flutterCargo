import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'dart:io';
import './base/dio_base.dart';

class GoodsResourceApi {
  /// 获取 发货 列表。 listType 列表类型 1-发货中 2-历史货源 3-常发货源
  static Future<AppResponse> getMasterPageList({
    int type,
    int pageNumber,
    int pageSize,
  }) {
    return ApiManger.instance.sendRequest(
      "goodsResource/getMasterPageList",
      "get",
      {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "listType": type,
      },
    );
  }
}
