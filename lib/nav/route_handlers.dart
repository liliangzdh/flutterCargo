/*
 *
 *
 */
import 'package:cargo_flutter_app/model/bill_entity.dart';
import 'package:cargo_flutter_app/pages/cargo/CargoDetail.dart';
import 'package:cargo_flutter_app/pages/cargo/send_cargo.dart';
import 'package:cargo_flutter_app/pages/login/Login.dart';
import 'package:cargo_flutter_app/pages/main/index.dart';
import 'package:cargo_flutter_app/pages/user_center/bill/bill_list.dart';
import 'package:cargo_flutter_app/pages/user_center/bill/transaction_detail.dart';
import 'package:cargo_flutter_app/pages/user_center/garage/vehicle_center.dart';
import 'package:cargo_flutter_app/pages/user_center/garage/vehicle_manage.dart';
import 'package:cargo_flutter_app/pages/user_center/invoice/edit/invoice_info_edit.dart';
import 'package:cargo_flutter_app/pages/user_center/invoice/manger/invoice_manger.dart';
import 'package:cargo_flutter_app/pages/user_center/question/question_detail.dart';
import 'package:cargo_flutter_app/pages/user_center/question/question_list.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as JSON;

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
    return CargoDetail(int.parse(cargoId), isSend == 'true');
  },
);

/// 发布货源
var sendCargoHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SendCargo();
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

var questionListHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return QuestionList();
  },
);

var questionDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String id = params['id']?.first ?? "0";
    return QuestionDetail(int.parse(id));
  },
);

var billListHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return BillList();
  },
);

var transactionDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    var json = params['item']?.first ?? "{}";
    BillEntity entity = BillEntity().fromJson(JSON.jsonDecode(json));
    return TransactionDetail(entity);
  },
);

// 车辆管理
var vehicleManageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return VehicleManage();
  },
);

// 车源中心
var vehicleCenterHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return VehicleCenter();
  },
);
