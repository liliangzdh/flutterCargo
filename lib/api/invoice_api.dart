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
        "query": {},
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
        "query": {},
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
        "query": {},
      },
    );
  }

  /// 批量申请开票
  static Future<AppResponse> batchInvoicingCommit(
      {amount, idArray, spUserName, userId}) {
    return ApiManger.instance.sendRequest(
      "invoicing/betchInvoicingCommit",
      "Post",
      {
        "amount": amount,
        "ids": idArray,
        "spUserName": spUserName,
        "userId": userId,
        "id": userId,
      },
    );
  }

  /// 获取 开票 信息 info。
  static Future<AppResponse> getInvoiceInfo() {
    return ApiManger.instance.sendRequest("invoice/get", "Post", {});
  }

  /// 编辑 开票信息 info
  static Future<AppResponse> editInvoiceInfo(params) {
    return ApiManger.instance.sendRequest("invoice/Edit", "Post", params);
  }
}
