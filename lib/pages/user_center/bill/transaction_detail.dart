import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/model/bill_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 交易详情
class TransactionDetail extends StatefulWidget {
  final BillEntity item;

  TransactionDetail(this.item);

  @override
  State<StatefulWidget> createState() {
    return _TransactionDetail();
  }
}

class _TransactionDetail extends State<TransactionDetail> {
  @override
  void initState() {
    super.initState();
  }

  var payMethodMap = {
    "1": '支付宝',
    "2": '微信',
    "3": '连连支付',
    "4": '银行卡',
    "5": '零钱',
  };

  @override
  Widget build(BuildContext context) {
    var showBottom = widget.item.type == 2;
    return Scaffold(
      backgroundColor: ColorConfig.color_f4f4f4,
      appBar: AppBar(
        title: Text('交易详情'),
        elevation: 0,
        backgroundColor: ColorConfig.colorfff,
      ),
      body: Container(
        child: Column(
          children: [
            getCell(
              child: Column(
                children: [
                  getTopCell('交易金额', '${widget.item.amount}元',
                      alignment: Alignment.centerRight),
                  Line(),
                  getTopCell(
                      '交易状态',
                      '${widget.item.isSuccess == 1 ? '成功' : widget.item.isSuccess == 0 ? '失败' : ''}',
                      alignment: Alignment.centerRight),
                  Line(),
                  getTopCell('支付方式',
                      '${payMethodMap['${widget.item.payMethod}'] ?? ''}',
                      alignment: Alignment.centerRight),
                ],
              ),
            ),
            showBottom
                ? Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                    child: Text(
                      '交易详情',
                      style: TextStyle(
                        color: ColorConfig.color00,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                : Container(),
            showBottom
                ? getCell(
                    child: Column(
                      children: [
                        getTopCell('起始地', '${widget.item.explain}'),
                        Line(),
                        getTopCell('目的地', ''),
                        Line(),
                        getTopCell('交易时间', '${widget.item.createTime}'),
                        Line(),
                        getTopCell('交易单号', '${widget.item.orderFlow}'),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget getCell({Widget child}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: ColorConfig.colorfff,
      ),
      margin: EdgeInsets.all(15),
      child: child,
    );
  }

  Widget getTopCell(String key, String name,
      {AlignmentGeometry alignment = Alignment.centerLeft}) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text('$key'),
          ),
          Expanded(
            child: Container(
              alignment: alignment,
              child: Text('$name'),
            ),
          )
        ],
      ),
    );
  }
}
