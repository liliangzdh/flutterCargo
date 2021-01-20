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
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Index();
  },
);

var loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Login();
  },
);

/// 货源详情页面
var cargoDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CargoDetail();
  },
);
