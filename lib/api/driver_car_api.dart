import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'dart:io';
import './base/dio_base.dart';

class DriverCarApi {
  /// 车源中心
  static Future<AppResponse> center(int pageNumber, int pageSize) {
    return ApiManger.instance.sendRequest(
      "driverCar/center",
      "post",
      {
        "size": pageSize,
        "start": pageNumber,
        "query": {},
      },
    );
  }
}
