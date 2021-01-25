import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/pages/user_center/bill/bill_manger/page/InProcessInvoicePage.dart';
import 'package:cargo_flutter_app/pages/user_center/bill/bill_manger/page/MayInvoicePage.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 发票管理
class BillManger extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BillManger();
  }
}

class _BillManger extends State<BillManger>
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
      print("======:${mController.index}");
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
        title: Text('发票管理'),
        backgroundColor: ColorConfig.colorfff,
        elevation: 0,
        actions: [
          MyRaisedButton(
            child: Text('开票信息'),
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
                MayInvoicePage(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
