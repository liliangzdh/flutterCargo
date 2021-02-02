/*
 *
 *
 */
import 'package:cargo_flutter_app/pages/cargo/cargo_detail/CargoDetail.dart';
import 'package:cargo_flutter_app/pages/login/Login.dart';
import 'package:cargo_flutter_app/pages/main/index.dart';
import 'package:cargo_flutter_app/pages/user_center/invoice/edit/invoice_info_edit.dart';
import 'package:cargo_flutter_app/pages/user_center/invoice/manger/invoice_manger.dart';
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


/// 发票管理。
var billMangerHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return InvoiceManger();
  },
);

/// 发票信息编辑
 var billInfoEditHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return InvoiceInfoEdit();
  },
);