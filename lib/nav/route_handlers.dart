/*
 *
 *
 */
import 'package:cargo_flutter_app/pages/cargo/cargo_detail/CargoDetail.dart';
import 'package:cargo_flutter_app/pages/login/Login.dart';
import 'package:cargo_flutter_app/pages/main/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Index();
  },
);

var loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Login();
  },
);

/// 货源详情页面
var cargoDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String cargoId = params['cargoId']?.first ?? "0";
    var isSend = params['isSend']?.first ?? "false";
    return CargoDetail(int.parse(cargoId),isSend == 'true');
  },
);
