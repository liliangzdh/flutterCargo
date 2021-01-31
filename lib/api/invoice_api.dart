import 'package:cargo_flutter_app/model/app_response.dart';
import './base/dio_base.dart';

class InvoiceApi {
  /// 获取 申请中发票 列表
  static Future<AppResponse> inList(
    int pageNumber,
    int pageSize,
  ) {
    return ApiManger.instance.sendRequest(
      "invoice/inList",
      "Post",
      {
        "size": pageSize,
        "start": pageNumber,
        "query": {
        },
      },
    );
  }


  static Future<AppResponse> endList(
      int pageNumber,
      int pageSize,
      ) {
    return ApiManger.instance.sendRequest(
      "invoice/endlist",
      "Post",
      {
        "size": pageSize,
        "start": pageNumber,
        "query": {
        },
      },
    );
  }

  static Future<AppResponse> list(
      int pageNumber,
      int pageSize,
      ) {
    return ApiManger.instance.sendRequest(
      "invoice/list",
      "Post",
      {
        "size": pageSize,
        "start": pageNumber,
        "query": {
        },
      },
    );
  }
}
