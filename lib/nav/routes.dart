/*
 *
 * 路由配置
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String login = '/login';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
  }
}
