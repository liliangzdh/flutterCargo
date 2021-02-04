import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/pages/user_center/garage/page/my_collection.dart';
import 'package:cargo_flutter_app/pages/user_center/garage/page/my_exclusive_driver.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VehicleManage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VehicleManage();
  }
}

/// 车辆管理。我的收藏 和 专属司机
class _VehicleManage extends State<VehicleManage>
    with SingleTickerProviderStateMixin {
  TabController mController;

  List<String> tabList = ['我的收藏', '专属司机'];

  @override
  void initState() {
    super.initState();
    mController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConfig.colorfff,
        title: Container(
          width: 170,
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
        actions: [
          Container(
            width: 50,
            child: MyRaisedButton(
              child: const Text(
                '添加',
                style: TextStyle(color: ColorConfig.color_4DA0FF),
              ),
              onPressed: () {
                RouteUtils.go(context, VehicleCenterKeyString);
              },
            ),
          )
        ],
      ),
      body: Container(
        child: TabBarView(
          controller: mController,
          children: [
            MyCollection(),
            MyExclusiveDriver(),
          ],
        ),
      ),
    );
  }
}
