/*
 *
 * 入口
 *
 * 
 *
 *
 */
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'application.dart';
import 'routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        primaryColor: ColorConfig.baseColor,
        // primarySwatch: ColorConfig.baseColor,
        // primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        // 这行是关键
        RefreshLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('zh'),
      ],
      locale: const Locale('zh'),
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        print("change language");
        return locale;
      },
      onGenerateRoute: Application.router.generator,
    );
//    print("initial route = ${app.initialRoute}");

    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => WaterDropHeader(),
      footerBuilder: () => ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,
      hideFooterWhenNotFull: true,
      shouldFooterFollowWhenNotFull: (state) {
        // If you want load more with noMoreData state ,may be you should return false
        return false;
      },
      child: app,
    );
  }
}
