import 'package:cargo_flutter_app/model/app_response.dart';
import './base/dio_base.dart';

class GoodsTypeApi {
  /// 获取 类型 类型
  static Future<AppResponse> getHotGoodsTypeList() {
    return ApiManger.instance.sendRequest(
      "goodsType/getHotGoodsTypeList",
      "get",
      {},
    );
  }

  /// 获取货物的最后更新时间
  static Future<AppResponse> getGoodTypeUpdateTime() {
    return ApiManger.instance.sendRequest(
      "goodsType/getUpdateTime",
      "get",
      {},
    );
  }

  /// 搜索货物类型
  static Future<AppResponse> searchGoodTypeList({String key}) {
    return ApiManger.instance.sendRequest(
      "goodsType/getGoodsTypeList",
      "get",
      {'childName': key},
    );
  }
}
