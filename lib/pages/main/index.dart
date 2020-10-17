import 'package:cargo_flutter_app/pages/main/garage/Garage.dart';
import 'package:cargo_flutter_app/pages/main/my/my_center.dart';
import 'package:cargo_flutter_app/pages/main/send/send_goods.dart';
import 'package:cargo_flutter_app/pages/main/waybill/way_bill.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';

// 首页四个按钮。
class Index extends StatefulWidget {
  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  final List<Widget> childList = [];
  int _currentIndex = 0;
  PageController mPageController = PageController(initialPage: 0);

  void onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
    mPageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    childList.add(new SendGoods());
    childList.add(new Garage());
    childList.add(new WayBill());
    childList.add(new MyCenter());
    //初始化登录操作
    // netInit.initAppState();
  }

  bottomNavigationBarItem(
      String title, String iconPath, String activeIconPath, int index) {
    return new BottomNavigationBarItem(
      icon: Image.asset(
        index != _currentIndex ? iconPath : activeIconPath,
        width: 18,
        height: 18,
      ),
      // activeIcon: Image.asset(activeIconPath,width: 22,height: 22),
      label: title,
      backgroundColor: ColorConfig.color_999,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child:
        SafeArea(
          child: SizedBox(
            height: 50,
            child: BottomNavigationBar(
              elevation:0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorConfig.colorfff,
              selectedLabelStyle:
                  TextStyle(color: ColorConfig.baseColor, height: 1.4),
              unselectedLabelStyle:
                  TextStyle(color: ColorConfig.color_999, height: 1.4),
              unselectedFontSize: 10,
              selectedFontSize: 10,
              items: [
                bottomNavigationBarItem("发货", "assets/images/home_normal.png",
                    'assets/images/home_select.png', 0),
                bottomNavigationBarItem("车库", 'assets/images/car_normal.png',
                    'assets/images/car_select.png', 1),
                bottomNavigationBarItem(
                    "运单",
                    'assets/images/waybill_normal.png',
                    'assets/images/waybill_select.png',
                    2),
                bottomNavigationBarItem("我的", 'assets/images/my_normal.png',
                    'assets/images/my_select.png', 3),
              ],
              currentIndex: _currentIndex,
              onTap: onTabChange,
            ),
          ),
        ),
        color: ColorConfig.colorfff,
      ),
      body: PageView(
        children: childList,
        controller: mPageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            if (_currentIndex != index) {
              _currentIndex = index;
            }
          });
        },
      ),
    );
  }
}
