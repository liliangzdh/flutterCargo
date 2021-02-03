import 'package:cargo_flutter_app/api/bill_api.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/bill_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert' as JSON;

/// 账单
class BillList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.color_f4f4f4,
      appBar: AppBar(
        title: Text('账单'),
        elevation: 0,
        backgroundColor: ColorConfig.colorfff,
      ),
      body: Container(
        child: UnitedListView(
          itemBuilder: (List<BillEntity> list, int position) {
            var item = list[position];
            return Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: MyRaisedButton(
                  onPressed: () {
                    RouteUtils.go(context, TransactionDetailKeyString, params: {
                      "item": Uri.encodeComponent(JSON.jsonEncode(item)),
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 26),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('${getType(item.type)}'),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Text('${item.amount}元'),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    '${item.createTime}',
                                    style: TextStyle(
                                      color: ColorConfig.color_999,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${getPayString(item)}',
                                        style: TextStyle(
                                          color: ColorConfig.color_999,
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
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: ColorConfig.color99,
                      ),
                    ],
                  )),
            );
          },
          pageRequest: (int pageNum, int pageSize) {
            return BillApi.getBillList(page: pageNum, pageSize: pageSize);
          },
          fromJson: (dynamic m) {
            return BillEntity().fromJson(m);
          },
        ),
      ),
    );
  }

  String getType(int type) {
    var explainString = '';
    switch (type) {
      case 1:
        explainString = "充值";
        break;
      case 2:
        explainString = "支付运费";
        break;
      case 3:
        explainString = "付定金";
        break;
      case 4:
        explainString = "提现";
        break;
      case 5:
        explainString = "支付保费";
        break;
      case 6:
        explainString = "退定金";
        break;
      case 7:
        explainString = "收到运费";
        break;
      case 8:
        explainString = "收到定金";
        break;
    }
    return explainString;
  }

  String getPayString(BillEntity itemData) {
    var statueString = '';

    if (itemData.type == 4) {
      if (itemData.isSuccess == 0) {
        statueString = '提现失败';
      } else if (itemData.isSuccess == 1) {
        statueString = '提现成功';
      } else if (itemData.isSuccess == 2) {
        statueString = '申请中';
      } else if (itemData.isSuccess == 3) {
        statueString = '交易成功';
      }
    } else {
      var kindString = '';
      if (itemData.type == 1) {
        kindString = '充值';
      } else {
        kindString = '支付';
      }
      if (itemData.isSuccess == 1) {
        statueString = kindString + '成功';
      } else {
        statueString = kindString + '失败';
      }
    }

    return statueString;
  }
}
