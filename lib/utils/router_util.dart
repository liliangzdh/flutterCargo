import 'package:cargo_flutter_app/nav/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String RootKeyString = "/";
const String LoginKeyString = '/login';
const String CargoDetailKeyString = '/cargoDetail';
const String InvoiceMangerKeyString = '/InvoiceManger';
const String InvoiceInfoEditKeyString = '/InvoiceInfoEdit';
const String QuestionListKeyString = '/questionList';
const String QuestionDetailKeyString = '/QuestionDetail';
const String BillListKeyString = '/BillList';
const String TransactionDetailKeyString = '/TransactionDetail';
const String VehicleManageHandlerKeyString = '/VehicleManageHandler';

class RouteUtils {
  // 避免 弹 出 多个 登录界面。
  static var _isGoLogin = false;

  static disLogin() {
    _isGoLogin = false;
  }

  static goLogin(BuildContext context) {
    context = context ?? navigatorKey.currentState.context;
    go(context, LoginKeyString);
  }

  static go(BuildContext context, String path, {dynamic params}) {
    if (path == LoginKeyString) {
      if (_isGoLogin) {
        // 如果已经 去了 登录界面。
        print("已经去了登录界面");
        return;
      }
      _isGoLogin = true;
    }

    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = params[key];
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }

    Application.router.navigateTo(
      context,
      '$path$query',
      transition: TransitionType.material,
    );
  }

  static goBack(BuildContext context) {
    Application.router.pop(context);
  }

// static go(BuildContext context, String path) {
//   // if (path == LoginKeyString) {
//   //   if (_isGoLogin) {
//   //     // 如果已经 去了 登录界面。
//   //     print("已经去了登录界面");
//   //     return;
//   //   }
//   //   _isGoLogin = true;
//   // }
//
//   // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//   //   return new Login();
//   // }));
// }
}
