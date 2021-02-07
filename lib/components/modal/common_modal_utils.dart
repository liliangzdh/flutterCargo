import 'package:cargo_flutter_app/components/city/province_city_Area_select.dart';
import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../line.dart';
import '../raised_button.dart';

const CancelReason = ['已找到司机', '货不走了', '没找到车', '其他原因'];

typedef CancelReasonCallBack = void Function(String reason);

class CommonModalUtils {
  Widget _getReasonItem(BuildContext context, double lineH, BoxDecoration box,
      String title, VoidCallback onPressed) {
    return Container(
      height: lineH,
      width: double.infinity,
      child: MyRaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
          if (onPressed != null) {
            onPressed();
          }
        },
        child: Container(
          height: lineH,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: box,
          child: Text(
            title,
            style: TextStyle(
              color: ColorConfig.color01,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  /// 取消 货源 弹窗。
  showCancelReasonModal(BuildContext context, GoodsResourceEntity item,
      CancelReasonCallBack onPressed) async {
    var lineH = 50.0;

    var box = BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 0.5, color: ColorConfig.color_E6E6E6),
      ),
    );
    var reasonWidgetList = CancelReason.map(
      (m) => _getReasonItem(context, lineH, box, m, () async {
        // 点击原因。
        if (onPressed != null) {
          onPressed(m);
        }
      }),
    ).toList();

    reasonWidgetList.insert(
      0,
      Container(
        height: lineH,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: box,
        child: Text('请选择删除货源的原因'),
      ),
    );

    reasonWidgetList.add(Container(
      height: 10,
      color: ColorConfig.color_E6E6E6,
    ));

    reasonWidgetList.add(Container(
      height: lineH,
      width: double.infinity,
      child: _getReasonItem(context, lineH, box, '取消', null),
    ));

    showMaterialModalBottomSheet(
      context: context,
      enableDrag: false,
      builder: (context) => Container(
        color: ColorConfig.colorfff,
        height: (CancelReason.length + 2) * lineH + 10 + 10,
        child: Column(
          children: reasonWidgetList,
        ),
      ),
    );
  }

  /// 普通的 删除 弹窗
  showCommonCancelDialog(BuildContext context,
      {String title = '确定删除么', VoidCallback onPressed}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                    color: ColorConfig.colorfff,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: ColorConfig.color33,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Line(),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    color: ColorConfig.colorfff,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: MyRaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                '取消',
                                style: TextStyle(
                                  color: ColorConfig.color33,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        color: ColorConfig.color_E6E6E6,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: MyRaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              if (onPressed != null) {
                                onPressed();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                '确定',
                                style: TextStyle(
                                  color: ColorConfig.color33,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /// 三级城市 选择
  showProvinceCityAreaSelect(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      enableDrag: false,
      backgroundColor: ColorConfig.colorfff,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      builder: (context) => ProvinceCityAreaSelect(),
    );
  }
}
