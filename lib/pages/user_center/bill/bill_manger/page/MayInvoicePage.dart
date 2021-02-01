import 'package:cargo_flutter_app/api/invoice_api.dart';
import 'package:cargo_flutter_app/components/CircleSelectBtn.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/config/event_action.dart';
import 'package:cargo_flutter_app/eventbus/event.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/common_list_params.dart';
import 'package:cargo_flutter_app/model/invoice_entity.dart';
import 'package:cargo_flutter_app/pages/user_center/bill/bill_manger/item/MayItem.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 可开具 发票 页面
///
///

class MayInvoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MayInvoicePage();
  }
}

class _MayInvoicePage extends State<MayInvoicePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final String key = '_MayInvoicePage';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MayInvoicePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  bool isSelectAll = false;

  CommonListParams<InvoiceEntity> params =
      CommonListParams(listData: [], isLoading: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var map = getSelectInfo();
    var count = map['count'];
    return Container(
      color: ColorConfig.color_f4f4f4,
      child: Column(
        children: [
          Expanded(
            child: UnitedListView<InvoiceEntity>(
              params: params,
              eventBusStringAction: key,
              itemBuilder: (List<InvoiceEntity> list, int index) {
                return new MayItem(
                  list[index],
                  itemClick: itemClick,
                );
              },
              pageRequest: (int pageNum, int pageSize) {
                return InvoiceApi.list(pageNum, pageSize);
              },
              fromJson: (dynamic m) {
                var entity = InvoiceEntity().fromJson(m);
                // 处理 isSelect 问题。
                if (idSelectArr.indexOf(entity.goodsId) != -1) {
                  entity.isSelect = true;
                }
                return entity;
              },
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.only(left: 10, right: 15),
            color: ColorConfig.colorfff,
            child: Row(
              children: [
                MyRaisedButton(
                  child: Row(
                    children: [
                      CircleSelectBtn(isSelectAll),
                      Text(
                        isSelectAll ? '取消' : '全选',
                        style: TextStyle(
                          color: ColorConfig.color33,
                        ),
                      ),
                    ],
                  ),
                  onPressed: selectAll,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('合计:'),
                      Text('${map['money'].toStringAsFixed(2)}元'),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10),
                        child: MyRaisedButton(
                          onPressed: startBilling,
                          color: ColorConfig.color60,
                          highlightColor: ColorConfig.color_4DA0FF,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              count > 0 ? '发票申请($count)' : '发票申请',
                              style: TextStyle(
                                color: ColorConfig.colorfff,
                              ),
                            ),
                          ),
                        ),
                        height: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  selectAll() {
    setState(() {
      isSelectAll = !isSelectAll;
      for (var value in params.listData) {
        value.isSelect = isSelectAll;
      }
    });
  }

  getSelectInfo() {
    var map = {
      "count": 0,
      "money": 0.0,
    };
    idSelectArr = [];
    for (var value in params.listData) {
      if (value.isSelect) {
        map['count'] += 1;
        map['money'] += value.totalCharge;
        idSelectArr.add(value.goodsId);
      }
    }
    return map;
  }

  List idSelectArr = [];

  itemClick(InvoiceEntity item) {
    setState(() {
      item.isSelect = !item.isSelect;
      for (var value in params.listData) {
        if (!value.isSelect) {
          isSelectAll = false;
          return;
        }
      }
      isSelectAll = true;
    });
  }

  // 开始开发票
  startBilling() async {
    var map = getSelectInfo();
    if (map['count'] == 0) {
      ToastUtils.show(msg: '请选择最少一个');
      return;
    }
    var idArray = [];

    var userId = 0;
    var spUserName = '';
    var totalMoney = 0.0;

    for (var value in params.listData) {
      if (value.isSelect) {
        idArray.add(value.goodsId);
        totalMoney += value.totalCharge;
      }

      userId = value.spUserId;
      spUserName = value.spUserName;
    }

    AppResponse appResponse = await InvoiceApi.batchInvoicingCommit(
      userId: userId,
      spUserName: spUserName,
      idArray: idArray,
      amount: totalMoney,
    );
    if (appResponse.isOk()) {
      ToastUtils.show(msg: '已提交申请');
      // 批量移除，
      setState(() {
        params.listData.removeWhere((value) => value.isSelect);
        if (params.listData.length == 0) {
          eventBus.fire(ListViewAction(key, RefreshKeyString));
          isSelectAll = false;
        }
      });
    } else {
      ToastUtils.show(msg: appResponse.msg);
    }
  }
}
