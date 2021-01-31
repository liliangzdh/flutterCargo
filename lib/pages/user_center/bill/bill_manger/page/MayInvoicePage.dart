import 'package:cargo_flutter_app/api/invoice_api.dart';
import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/invoice_entity.dart';
import 'package:cargo_flutter_app/model/invoice_info_entity.dart';
import 'package:cargo_flutter_app/pages/user_center/bill/bill_manger/item/InvoiceItem.dart';
import 'package:cargo_flutter_app/pages/user_center/bill/bill_manger/item/MayItem.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: ColorConfig.color_f4f4f4,
      child: UnitedListView<InvoiceEntity>(
        itemBuilder: (List<InvoiceEntity> list, int index) {
          return new MayItem(list[index]);
        },
        pageRequest: (int pageNum, int pageSize) {
          return InvoiceApi.list(pageNum, pageSize);
        },
        fromJson: (dynamic m) {
          return InvoiceEntity().fromJson(m);
        },
      ),
    );
  }
}
