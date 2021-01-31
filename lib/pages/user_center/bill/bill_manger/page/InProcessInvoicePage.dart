import 'package:cargo_flutter_app/api/goods_resource_api.dart';
import 'package:cargo_flutter_app/api/invoice_api.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:cargo_flutter_app/model/invoice_info_entity.dart';
import 'package:cargo_flutter_app/pages/user_center/bill/bill_manger/item/InvoiceItem.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 申请中 发票 页面
///
///

class InProcessInvoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InProcessInvoicePage();
  }
}

class _InProcessInvoicePage extends State<InProcessInvoicePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: ColorConfig.color_f4f4f4,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: new UnitedListView<InvoiceInfoEntity>(
        itemBuilder: (List<InvoiceInfoEntity> list, int index) {
          return new InvoiceItem(item: list[index]);
        },
        pageRequest: (int pageNum, int pageSize) {
          return InvoiceApi.inList(pageNum, pageSize);
        },
        fromJson: (dynamic m) {
          return InvoiceInfoEntity().fromJson(m);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
