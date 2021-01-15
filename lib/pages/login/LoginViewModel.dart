import 'dart:async';

import 'package:cargo_flutter_app/api/currency_api.dart';
import 'package:cargo_flutter_app/api/user_api.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/user_info_entity.dart';
import 'package:cargo_flutter_app/mvvm/base_view_model.dart';
import 'package:cargo_flutter_app/mvvm/state/LoginState.dart';
import 'package:cargo_flutter_app/nav/application.dart';
import 'package:cargo_flutter_app/provider/single_global_instance/appstate_bloc.dart';
import 'package:cargo_flutter_app/utils/share_perference_utils.dart';
import 'package:cargo_flutter_app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';


class LoginViewModel extends BaseViewModel<LoginState> {
  final passwordController = TextEditingController(text: '123456');

  final usernameController = TextEditingController(text: '15001197799');

  final codeController = TextEditingController();

  @override
  LoginState initModal() {
    return LoginState(0, false);
  }

  sendCode() async {
    var username = usernameController.text;
    if (username == null || username.length == 0) {
      ToastUtils.show(msg: '请输入手机号码!');
      return;
    }
    setLoading(text: '正在获取验证码...');
    AppResponse response = await CurrencyApi.sendCode(username);
    hideLoading();
    if (response.isOk()) {
      ToastUtils.show(msg: '验证码发送成功');
      // 倒计时。60秒。
      startCountdownTimer();
    } else {
      ToastUtils.show(msg: response.msg);
    }
  }

  Timer _timer;

  void startCountdownTimer() {
    dataSource.start = true;
    dataSource.countdownTime = 60;
    updateDataSource(dataSource);
    _timer?.cancel();
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (dataSource.countdownTime < 1) {
        _timer?.cancel();
        dataSource.start = false;
      } else {
        dataSource.countdownTime--;
      }
      updateDataSource(dataSource);
    });
  }

  @override
  dispose() {
    super.dispose();
    _timer?.cancel();
  }

  ///登录
  login(BuildContext context, bool isPassword) async {
    var username = usernameController.text;
    var password = passwordController.text;
    var code = codeController.text;
    if (username == null || username.length == 0) {
      ToastUtils.show(msg: '请输入手机号码!');
      return;
    }

    if (isPassword) {
      if (password == null || password.length == 0) {
        ToastUtils.show(msg: "请输入密码!");
        return;
      }
    } else {
      if (code == null || code.length == 0) {
        ToastUtils.show(msg: "请输入验证码！");
        return;
      }
    }

    keyboardDismiss(context);
    setLoading(text: '正在登陆');
    // return;
    // "15001197799" "123456"

    AppResponse response;
    if (isPassword) {
      // 密码登录
      response = await UserApi.accountLogin(username, password);
    } else {
      // 验证码登录
      response = await UserApi.codeLogin(username, code);
    }

    hideLoading();
    if (!response.isOk()) {
      ToastUtils.show(msg: response.msg);
      return;
    }
    print('-------token:${response.data['token']}');
    var infoMap = response.data['userInfo'];
    var info = UserInfoEntity().fromJson(infoMap);

    appStateBloc.setUerInfo(info);

    await SharePreferenceUtils.saveToken(response.data['token']);
    await SharePreferenceUtils.saveUserInfo(infoMap);

    Application.router.pop(context);
  }
}
