/*
 *
 * 入口
 *
 * 
 *
 *
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'application.dart';
import 'routes.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: '约货货主端',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
//    print("initial route = ${app.initialRoute}");
    return app;
  }
}
