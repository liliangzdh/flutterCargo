import 'package:cargo_flutter_app/components/my_clipper.dart';
import 'package:cargo_flutter_app/config/config.dart';
import 'package:cargo_flutter_app/model/user_info_entity.dart';
import 'package:cargo_flutter_app/provider/single_global_instance/appstate.dart';
import 'package:cargo_flutter_app/provider/single_global_instance/appstate_bloc.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 我的页面
class MyCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCenter();
  }
}

class _MyCenter extends State<MyCenter> with TickerProviderStateMixin {
  var listData = [
    {'icon': 'assets/images/my/car_manger.png', 'name': '车辆管理', "url": ""},
    {'icon': 'assets/images/my/bill.png', 'name': '账单', "url": ""},
    {'icon': 'assets/images/my/data_statistics.png', 'name': '数据统计', "url": ""},
    {'icon': 'assets/images/my/invoices_manger.png', 'name': '发票管理', "url": ""},
    {
      'icon': 'assets/images/my/question_consultation.png',
      'name': '问题咨询',
      "url": ""
    },
    {'icon': 'assets/images/my/evaluate_manger.png', 'name': '评价管理', "url": ""},
    {'icon': 'assets/images/my/insure_icon.png', 'name': '投保管理', "url": ""},
    {'icon': 'assets/images/my/share_icon.png', 'name': '分享'},
    {'icon': 'assets/images/my/share_icon.png', 'name': '登录', "url": "login"},
  ];

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

  String getName(UserInfoEntity userInfo) {
    if (userInfo == null) {
      return "";
    }
    if (userInfo.state == 0 || userInfo.state == 5 || userInfo.state == 6) {
      return '未实名';
    }
    return userInfo.name;
  }

  double topHeight = 260;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorConfig.color_f4f4f4,
      child: Stack(children: [

        SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: topHeight,
                  // color: ColorConfig.color_999,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/my_top_bg.png",
                        width: double.infinity,
                        fit: BoxFit.fill,
                        height: topHeight,
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: StreamBuilder(
                            stream: appStateBloc.stream,
                            initialData: appStateBloc.value,
                            builder: (BuildContext context,
                                AsyncSnapshot<AppState> snapshot) {
                              var userInfo = snapshot.data.userInfo;
                              return Column(
                                children: [
                                  // buildHeader(),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            clipper: MyClipper(2),
                                            child: userInfo == null ||
                                                userInfo.headUrl ==
                                                    null ||
                                                userInfo.headUrl.isEmpty
                                                ? Image.asset(
                                              "assets/images/logo.png",
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.fill,
                                            )
                                                : Image.network(
                                              "${UrlConfig.ImageBaseUlr}${userInfo.headUrl}",
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      getName(userInfo),
                                                      style: TextStyle(
                                                        color: ColorConfig
                                                            .colorfff,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '企业',
                                                        style: TextStyle(
                                                          color: ColorConfig
                                                              .baseColor,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      padding:
                                                      EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                      ),
                                                      decoration:
                                                      BoxDecoration(
                                                        color:
                                                        Color(0xFFC8E5FF),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            4), // 圆角度
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 4),
                                                  child: Text(
                                                    '交易${userInfo?.orderVo?.orderNum ?? '0'} | 发货${userInfo?.orderVo?.sendNum ?? '0'}',
                                                    style: TextStyle(
                                                      color: ColorConfig
                                                          .colorfff,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 82,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '0元',
                                                  style: TextStyle(
                                                      color: ColorConfig
                                                          .baseColor),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 8),
                                                  child: Text(
                                                    '余额（元）',
                                                    style: TextStyle(
                                                        color: ColorConfig
                                                            .color_999),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            padding: EdgeInsets.only(
                                              bottom: 20,
                                              top: 10,
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
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Image.asset(
                                                  "assets/images/wallet.png",
                                                  fit: BoxFit.fill,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 8),
                                                  child: Text(
                                                    '我的钱包',
                                                    style: TextStyle(
                                                        color: ColorConfig
                                                            .color_999),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            padding: EdgeInsets.only(
                                              bottom: 20,
                                              top: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
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
                  height: getListHeight(),
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15,bottom: 20),
                  padding: EdgeInsets.all(10),
                  child: buildList(),
                  decoration: BoxDecoration(
                    color: ColorConfig.colorfff,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ),

        buildHeader()
      ],),
    );
  }

  List<Widget> getWidgetList() {
    return listData.map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(item) {
    return Container(
      child: RaisedButton(
        elevation: 0,
        padding: EdgeInsets.zero,
        color: ColorConfig.colorfff,
        splashColor: ColorConfig.colorEf,
        highlightColor: ColorConfig.colorEf,
        highlightElevation: 0,
        onPressed: () {
          String path = item['url'];
          if (path != null && path.length > 0) {
            RouteUtils.go(context, item['url']);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item['icon'],
              width: 40,
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                height: 20,
                child: Text(
                  item['name'],
                  style: TextStyle(
                    color: ColorConfig.color33,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 根据  列表个数 算出，整体 需要的高度
  getListHeight() {
    var screenWidth = CommonUtils.getScreenWidth(context);
    // 屏幕宽度 - 左右的margin 15 * 2，-  3个 10 。/4
    double oneHeight = (screenWidth - 15 * 2 - 10 * 5) / 4;
    var lines = (listData.length / 4).ceil();
    return oneHeight * lines + 15 * lines;
  }

  // 我的服务
  Widget buildList() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      //水平子Widget之间间距
      crossAxisSpacing: 10.0,
      //垂直子Widget之间间距
      mainAxisSpacing: 15.0,
      //GridView内边距
      padding: EdgeInsets.all(0.0),
      //一行的Widget数量
      crossAxisCount: 4,
      //子Widget宽高比例
      childAspectRatio: 1.0,
      //子Widget列表
      children: getWidgetList(),
    );
  }
}
