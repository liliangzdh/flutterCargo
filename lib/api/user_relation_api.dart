import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'dart:io';
import './base/dio_base.dart';

class UserRelationApi {
  /// 收藏 的 司机 列表
  static Future<AppResponse> getCollectionDriverList(
      int pageNumber, int pageSize) {
    return ApiManger.instance.sendRequest(
      "userRelation/SpFollowDriverList",
      "post",
      {
        "size": pageSize,
        "start": pageNumber,
        "query": {},
      },
    );
  }

  /// 获取 专属司机 列表
  static Future<AppResponse> getExclusiveDriverList(
      int pageNumber, int pageSize) {
    return ApiManger.instance.sendRequest(
      "userRelation/SpDriverList",
      "post",
      {
        "size": pageSize,
        "start": pageNumber,
        "query": {},
      },
    );
  }
}
