import 'package:cargo_flutter_app/model/user_info_entity.dart';
import 'package:flutter/cupertino.dart';
import '../../api/login_api.dart';
import '../../utils/share_perference_utils.dart';
import '../../model/app_response.dart';
import '../../mvvm/base_view_model.dart';
import '../../utils/toast_utils.dart';
import 'package:fluro/fluro.dart';
import '../../provider/single_global_instance/appstate_bloc.dart';
import 'package:cargo_flutter_app/nav/application.dart';

class LoginViewModel extends BaseViewModel<bool> {
  @override
  bool iniLoadingState() {
    return false;
  }

  final passwordController = TextEditingController();

  final usernameController = TextEditingController();

  ///登录
  login(BuildContext context) async {
    var username = usernameController.text;
    var password = passwordController.text;
    if (username == null || username.length == 0) {
      ToastUtils.show(msg: '请输入用户名!');
      return;
    }

    if (password == null || password.length == 0) {
      ToastUtils.show(msg: "请输入密码!");
      return;
    }
    keyboardDismiss(context);
    setLoading(true);
    await Future.delayed(Duration(seconds: 1));
    // "15001197799" "123456"
    AppResponse response = await LoginApi.accountLogin(username, password);
    setLoading(false);
    if (!response.isOk()) {
      ToastUtils.show(msg: response.msg);
      return;
    }
    print('-------token:${response.data['token']}');
    var info = UserInfoEntity().fromJson(response.data['userInfo']);

    appStateBloc.setUerInfo(info);
    await SharePreferenceUtils.saveToken(response.data['token']);

    Application.router.pop(context);
  }
}
