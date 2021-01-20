import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
}
