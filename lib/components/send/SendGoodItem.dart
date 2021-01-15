import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../line.dart';

/// 发货中，发货历史。常发货源。三合一。页面的Item。
class SendGoodItem extends StatelessWidget {
  int type;
  GoodsResourceEntity item;

  SendGoodItem({Key key, this.type = 0, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfig.colorfff,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                        child: Text(
                          '${item.fromCity}${item.fromArea} → ${item.toCity}${item.toArea}',
                          style: TextStyle(
                            color: ColorConfig.color33,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        item.getFormatCargoInfoString(),
                        style: TextStyle(
                          color: ColorConfig.color_999,
                          fontSize: 12,
                        ),
                      ),
                      ((item.predictPrice > 0 || item.deposit > 0) && type == 1)
                          ? Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Row(
                                children: [
                                  Text(
                                    '预估运费 ${item.predictPrice}',
                                    style: TextStyle(
                                      color: ColorConfig.color33,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '定金 ${item.deposit}',
                                        style: TextStyle(
                                          color: ColorConfig.color33,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 0, bottom: 15),
                            ),
                    ],
                  ),
                ),
                Line(
                  height: 1,
                  color: ColorConfig.color_E6E6E6,
                ),
                Container(
                  height: 46,
                  margin: EdgeInsets.only(right: 12, left: 12),
                  child: Row(
                    children: [
                      type != 3
                          ? Text(
                              '${item.createTime}',
                              style: TextStyle(
                                color: ColorConfig.color_999,
                                fontSize: 12,
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: buildBottomBtn(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Line(
                  height: 10,
                  color: ColorConfig.color_f4f4f4,
                ),
              ],
            ),
          ),
          type == 1
              ? Image.asset(
                  'assets/images/stay_receiving_orders.png',
                  width: 44,
                  height: 44,
                )
              : Container()
        ],
      ),
    );
  }

  List<Widget> buildBottomBtn() {
    if (type == 1) {
      return [
        buildBtn(
          title: '删除货源',
          color: ColorConfig.color_999,
          onPressed: () {},
        ),
        buildBtn(
          title: '指定司机',
          color: ColorConfig.color_4DA0FF,
          onPressed: () {},
        ),
      ];
    }

    if (type == 2) {
      return [
        buildBtn(
          title: '存为常发货源',
          color: ColorConfig.color_999,
          onPressed: () {},
        ),
        buildBtn(
          title: '再发一单',
          color: ColorConfig.color_4DA0FF,
          onPressed: () {},
        ),
      ];
    }
    return [
      buildBtn(
        title: '取消',
        color: ColorConfig.color_999,
        onPressed: () {},
      ),
      buildBtn(
        title: '再发一单',
        color: ColorConfig.color_4DA0FF,
        onPressed: () {},
      ),
    ];
  }

  Widget buildBtn({String title, Color color, VoidCallback onPressed}) {
    return Container(
      width: 60 + (title.length - 4 > 0 ? 24.0 : 0.0),
      height: 30,
      margin: EdgeInsets.only(left: 10),
      child: RaisedButton(
        elevation: 0,
        highlightElevation: 0,
        padding: EdgeInsets.zero,
        color: ColorConfig.colorfff,
        splashColor: ColorConfig.colorEf,
        highlightColor: ColorConfig.colorEf,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            width: 1,
            color: color,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
