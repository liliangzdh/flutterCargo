import 'package:cargo_flutter_app/model/invoice_info_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class InvoiceItem extends StatelessWidget {
  final InvoiceInfoEntity item;

  InvoiceItem({this.item});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorConfig.colorfff,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorConfig.color_E8F3FE,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '${item.spUserName}',
                      style: TextStyle(
                        color: ColorConfig.color33,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          '发票金额${item.amount}',
                          style: TextStyle(
                            color: ColorConfig.color99,
                            fontSize: 14,
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      '${item.createTime}',
                      style: TextStyle(
                        color: ColorConfig.color33,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          '包含运单：${item.goodsIds??1}',
                          style: TextStyle(
                            color: ColorConfig.color99,
                            fontSize: 14,
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
