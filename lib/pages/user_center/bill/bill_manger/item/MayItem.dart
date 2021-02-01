import 'package:cargo_flutter_app/components/CircleSelectBtn.dart';
import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/model/invoice_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:flutter/widgets.dart';

/// 可开具发票 item

typedef void OnItemClick(InvoiceEntity item);

class MayItem extends StatelessWidget {
  final InvoiceEntity item;
  final OnItemClick itemClick;

  MayItem(
    this.item, {
    this.itemClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConfig.colorfff,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      margin: EdgeInsets.all(15),
      child: MyRaisedButton(
        onPressed: () {
          if (itemClick != null) {
            itemClick(item);
          }
        },
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleSelectBtn(item.isSelect),
            Expanded(
              child: Column(
                children: [
                  buildPoint(
                      'assets/images/starting_point.png',
                      "${item.fromProvince ?? ''}${item.fromCity ?? ''}",
                      "装 ${CommonUtils.formatCDate(item.sendTime)}"),
                  Line(),
                  buildPoint(
                      'assets/images/end_point.png',
                      "${item.toProvince ?? ''}${item.toCity ?? ''}",
                      "卸 ${CommonUtils.formatCDate(item.unloadingTime)}"),
                  Line(),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(children: [
                              Text(
                                '货主：',
                                style: TextStyle(
                                  color: ColorConfig.color33,
                                  fontSize: 14,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '${item.spUserName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ColorConfig.color33,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Text(
                          '￥${item.totalCharge}元',
                          style: TextStyle(
                            color: ColorConfig.color33,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Line(
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  MyRaisedButton(
                    color: ColorConfig.color_E8F3FE,
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 40,
                      child: Text(
                        '运单详情',
                        style: TextStyle(
                          color: ColorConfig.color_4DA0FF,
                          fontSize: 16,
                        ),
                      ),
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

  Widget buildPoint(String path, String location, String time) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Image.asset(
            path,
            width: 22,
            height: 22,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              location,
              maxLines: 1,
              style: TextStyle(
                color: ColorConfig.color33,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                time,
                style: TextStyle(
                  color: ColorConfig.color99,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
