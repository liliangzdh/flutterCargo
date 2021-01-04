import 'package:cargo_flutter_app/nav/application.dart';
import 'package:cargo_flutter_app/provider/single_global_instance/appstate.dart';
import 'package:cargo_flutter_app/provider/single_global_instance/appstate_bloc.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import '../../../components/tran.dart';

class MyCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCenter();
  }
}

class _MyCenter extends State<MyCenter> with TickerProviderStateMixin {
  // 头部
  Widget buildHeader() {
    return Container(
      width: double.infinity,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              '我的',
              style: TextStyle(color: ColorConfig.colorfff, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Positioned(
              right: 15,
              child: Icon(
                Icons.settings,
                color: ColorConfig.colorfff,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorConfig.color_f4f4f4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 220,
            // color: ColorConfig.color_999,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/my_top_bg.png",
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: 220,
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      children: [
                        buildHeader(),
                        Expanded(
                            child: Container(
                              // color: ColorConfig.color_999,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1278861826,467317210&fm=26&gp=0.jpg',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '用户名',
                                              style: TextStyle(
                                                color: ColorConfig.colorfff,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '企业',
                                                style: TextStyle(
                                                  color: ColorConfig.baseColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFC8E5FF),
                                                borderRadius:
                                                BorderRadius.circular(4), // 圆角度
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4),
                                          child: Text(
                                            '交易17 | 发货29',
                                            style: TextStyle(
                                              color: ColorConfig.colorfff,
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Container(
                          height: 72,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '0元',
                                        style: TextStyle(
                                            color: ColorConfig.baseColor),
                                      ),
                                      Text(
                                        '余额（元）',
                                        style: TextStyle(
                                            color: ColorConfig.color_999),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                ),
                              ),
                              Container(
                                color: ColorConfig.colorEf,
                                width: 1,
                                height: double.infinity,
                              ),
                              Expanded(
                                child: Padding(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '0元',
                                        style: TextStyle(
                                            color: ColorConfig.baseColor),
                                      ),
                                      Text(
                                        '我的钱包',
                                        style: TextStyle(
                                            color: ColorConfig.color_999),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              '我的服务',
              style: TextStyle(
                color: ColorConfig.color33,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            padding: EdgeInsets.all(15),
            child: Text('den'),
            decoration: BoxDecoration(
              color: ColorConfig.colorfff,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          RaisedButton(
            child: Text('点击登录'),
            onPressed: () {
              Application.router.navigateTo(
                context,
                '/login',
                transitionDuration: Duration(seconds: 1),
                transition: TransitionType.inFromRight,
              );
              print('34---->');
            },
          ),
          StreamBuilder(
            stream: appStateBloc.stream,
            initialData: appStateBloc.value,
            builder: (BuildContext context, AsyncSnapshot<AppState> snapshot) {
              return Text('${snapshot.data.isLogin ? "登录了" : "未登录"}');
            },
          )
        ],
      ),
    );
  }
}
