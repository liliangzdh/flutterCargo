import 'package:cargo_flutter_app/mvvm/state/LoadingState.dart';
import 'package:cargo_flutter_app/mvvm/state/LoginState.dart';
import 'package:cargo_flutter_app/utils/toast_utils.dart';

import '../../components/loading.dart';
import '../../pages/login/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import '../../components/line.dart';
import '../../theme/colors.dart';
import '../../components/tran.dart';
import 'dart:math' as math;

/// 登录界面

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Login();
  }
}

class _Login extends State<Login> with TickerProviderStateMixin {
  LoginViewModel viewModel = LoginViewModel();

  bool isCode = false;

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 0.5,
      vsync: this,
      // animationBehavior: AnimationBehavior.preserve,
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }

  // 构建 单个 的输入框。
  Widget buildInputCell(String tip, String hintText, bool isCode,
      TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tip,
          style: TextStyle(color: ColorConfig.color33),
        ),
        Row(
          children: [
            Container(
              child: Expanded(
                child: TextField(
                  maxLines: 1,
                  controller: controller,
                  style: TextStyle(
                    color: ColorConfig.color33,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: ColorConfig.color_999,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            buildCode(isCode),
          ],
        ),
        Line(
          height: 0.5,
          color: ColorConfig.color_999,
        ),
      ],
    );
  }

  Widget buildCode(bool isCode) {
    if (isCode) {
      return StreamBuilder<LoginState>(
        stream: viewModel.outputDataStream,
        initialData: viewModel.dataSource,
        builder: (context, snapshot) {
          var data = snapshot.data;
          print('$data');
          return InkWell(
            onTap: () {
              if(data.start){
                ToastUtils.show(msg:'正在倒计时，请稍等');
                return;
              }
              viewModel.sendCode();
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: Text(
                data.start ? '${data.countdownTime}秒' : '验证码',
                style: TextStyle(
                  color: ColorConfig.color_4DA0FF,
                  fontSize: 12,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: ColorConfig.color_4DA0FF,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              ),
            ),
          );
        },
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    // 键盘是否展示。
    bool isKeyboardShow = MediaQuery.of(context).viewInsets.vertical > 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          color: ColorConfig.colorfff,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                child: RotationTransitionY(
                  turns: controller,
                  alignment: Alignment.center,
                  child: buildMain(context),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Offstage(
                  offstage: isKeyboardShow,
                  child: Container(
                    color: ColorConfig.colorfff,
                    padding: EdgeInsets.only(bottom: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: '首次登录自动注册约货账号，且已阅读并同意\n',
                            style: TextStyle(
                              color: ColorConfig.color_999,
                              fontSize: 10,
                              height: 4,
                            )),
                        TextSpan(
                          text: '《用户服务协议》',
                          style: TextStyle(
                            color: ColorConfig.baseColor,
                            fontSize: 10,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('用户服务协议');
                            },
                        ),
                        TextSpan(
                          text: '和',
                          style: TextStyle(
                              color: ColorConfig.color_999, fontSize: 10),
                        ),
                        TextSpan(
                          text: '《隐私政策协议》',
                          style: TextStyle(
                            color: ColorConfig.baseColor,
                            fontSize: 10,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('12隐私政策协议');
                            },
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              StreamBuilder<LoadingState>(
                stream: viewModel.outputLoadingStateStream,
                initialData: viewModel.loadingState,
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  print('$data');
                  return Loading(
                    data.isLoading,
                    text: data.text,
                    onTap: () {
                      // 隐藏
                      viewModel.hideLoading();
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }

  changeLoginType(bool isCode) {
    if (isCode) {
      controller.forward();
    } else {
      controller.reverse();
    }
    Future.delayed(Duration(milliseconds: 250), () {
      setState(() {
        this.isCode = isCode;
      });
    });
  }

  Widget buildMain(BuildContext context) {
    if (isCode) {
      // 验证码 登录。
      return SingleChildScrollView(
        child: Transform(
          transform: Matrix4.rotationY(math.pi),
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 30, bottom: 90, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: buildInputCell(
                      '手机号', '请输入手机号码', false, viewModel.usernameController),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: buildInputCell(
                      '验证码', '请输入验证码', true, viewModel.codeController),
                ),
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  height: 30,
                  child: RaisedButton(
                    color: ColorConfig.colorfff,
                    splashColor: ColorConfig.colorEf,
                    highlightColor: ColorConfig.colorEf,
                    elevation: 0,
                    highlightElevation: 0,
                    onPressed: () {
                      changeLoginType(false);
                    },
                    child: Text(
                      '账户密码登录',
                      style: TextStyle(color: ColorConfig.baseColorPrime),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(top: 30),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: ColorConfig.baseColor,
                    elevation: 0,
                    highlightElevation: 0,
                    disabledElevation: 0,
                    onPressed: () {
                      viewModel.login(context, false);
                    },
                    child: Text('验证码登录',
                        style: TextStyle(
                          color: ColorConfig.colorfff,
                          fontSize: 18,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 30, bottom: 90, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fill,
              width: 60,
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: buildInputCell(
                  '手机号', '请输入手机号码', false, viewModel.usernameController),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: buildInputCell(
                  '密码', '请输入登录密码', false, viewModel.passwordController),
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              height: 30,
              child: RaisedButton(
                elevation: 0,
                color: ColorConfig.colorfff,
                splashColor: ColorConfig.colorEf,
                highlightColor: ColorConfig.colorEf,
                onPressed: () {
                  changeLoginType(true);
                },
                child: Text(
                  '验证码登录',
                  style: TextStyle(color: ColorConfig.baseColorPrime),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(top: 30),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: ColorConfig.baseColor,
                elevation: 0,
                highlightElevation: 0,
                disabledElevation: 0,
                onPressed: () {
                  viewModel.login(context, true);
                },
                child: Text('登录',
                    style: TextStyle(
                      color: ColorConfig.colorfff,
                      fontSize: 18,
                    )),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '密码忘记了？点击',
                    style: TextStyle(
                      color: ColorConfig.color_999,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '修改密码',
                    style: TextStyle(
                      color: ColorConfig.baseColor,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
