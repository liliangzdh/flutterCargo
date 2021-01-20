import 'package:cargo_flutter_app/model/app_response.dart';
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

  /// 设置 常发货源
  static Future<AppResponse> goodsResourceOften({dynamic id}) {
    return ApiManger.instance.sendRequest(
      "goodsResource/often",
      "Post",
      {
        "id": id,
      },
    );
  }

  /// 取消常发货源
  static Future<AppResponse> goodsResourceOftenCancel({dynamic id}) {
    return ApiManger.instance.sendRequest(
      "goodsResource/oftenCancel",
      "Post",
      {
        "id": id,
      },
    );
  }

  /// 发货中。取消货源
  static Future<AppResponse> goodsResourceCancel(
      {dynamic id, String cancelReason}) {
    return ApiManger.instance.sendRequest(
      "goodsResource/cancel",
      "Post",
      {
        "goodsId": id,
        "cancelReason": cancelReason,
      },
    );
  }

  /// 删除 货源
  static Future<AppResponse> goodsResourceDel({dynamic id}) {
    return ApiManger.instance.sendRequest(
      "goodsResource/del",
      "Post",
      {
        "id": id,
      },
    );
  }
}
