import 'package:cargo_flutter_app/nav/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

class RouteUtils {
  static goLogin(BuildContext context){
    go(context, 'login');
  }

  static go(BuildContext context,String path){
    Application.router.navigateTo(
      context,
      '/$path',
      transition: TransitionType.inFromRight,
    );
  }

}
