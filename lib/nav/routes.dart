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
    router.define(SendCargoKeyString, handler: sendCargoHandler);

    router.define(InvoiceMangerKeyString, handler: billMangerHandler);
    router.define(InvoiceInfoEditKeyString, handler: billInfoEditHandler);

    router.define(QuestionListKeyString, handler: questionListHandler);
    router.define(QuestionDetailKeyString, handler: questionDetailHandler);

    router.define(BillListKeyString, handler: billListHandler);
    router.define(TransactionDetailKeyString, handler: transactionDetailHandler);


    router.define(VehicleManageHandlerKeyString, handler: vehicleManageHandler);
    router.define(VehicleCenterKeyString, handler: vehicleCenterHandler);
  }
}
