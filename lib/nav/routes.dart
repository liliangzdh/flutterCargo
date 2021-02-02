/*
 *
 * 路由配置
 */
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(RootKeyString, handler: rootHandler);
    router.define(LoginKeyString, handler: loginHandler);
    router.define(CargoDetailKeyString, handler: cargoDetailHandler);
    router.define(InvoiceMangerKeyString, handler: billMangerHandler);
    router.define(InvoiceInfoEditKeyString, handler: billInfoEditHandler);
  }
}
