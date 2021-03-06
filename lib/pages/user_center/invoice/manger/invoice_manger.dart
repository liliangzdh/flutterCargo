import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/pages/user_center/invoice/manger/page/AlreadyInvoicePage.dart';
import 'package:cargo_flutter_app/pages/user_center/invoice/manger/page/InProcessInvoicePage.dart';
import 'package:cargo_flutter_app/pages/user_center/invoice/manger/page/MayInvoicePage.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 发票管理
class InvoiceManger extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InvoiceManger();
  }
}

class _InvoiceManger extends State<InvoiceManger>
    with SingleTickerProviderStateMixin {
  TabController mController;
  List<String> tabList = ['可开具发票', '申请中发票', '已开具发票'];

  @override
  void initState() {
    super.initState();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );

    mController.addListener(() {
      print("滚动：${mController.index}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发票管理'),
        backgroundColor: ColorConfig.colorfff,
        elevation: 0,
        actions: [
          MyRaisedButton(
            child: const Text('开票信息'),
            onPressed: () {
              RouteUtils.go(context, InvoiceInfoEditKeyString);
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Container(
                child: TabBar(
                  isScrollable: false,
                  controller: mController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: ColorConfig.baseColorDark,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: ColorConfig.color66,
                  tabs: tabList.map((item) {
                    return Tab(
                      text: item,
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: mController,
                children: [
                  MayInvoicePage(),
                  InProcessInvoicePage(),
                  AlreadyInvoicePage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
