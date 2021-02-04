import 'package:cargo_flutter_app/components/ace_tabbar_indicator.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/model/tab_title.dart';
import 'package:cargo_flutter_app/pages/main/send/page/send_good_list.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SendGoods extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SendGoods();
  }
}

class _SendGoods extends State<SendGoods> with SingleTickerProviderStateMixin {
  PageController mPageController = PageController();
  TabController mController;

  @override
  void initState() {
    super.initState();
    initTabData();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mController.addListener(() {
      //TabBar的监听
      if (mController.indexIsChanging) {
        //判断TabBar是否切换
        onPageChange(mController.index, p: mPageController);
      }
    });
  }

  var isPageCanChanged = true;

  var currentPage = 0;

  onPageChange(int index, {PageController p, TabController t}) async {
    setState(() {
      currentPage = index;
    });
    if (p != null) {
      //判断是哪一个切换
      isPageCanChanged = false;
      await mPageController.animateToPage(index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      mController.animateTo(index); //切换Tabbar
    }
    print("---onPageChange: $index");
  }

  List<TabTitle> tabList;

  initTabData() {
    tabList = [
      TabTitle('发货中', 0),
      TabTitle('发货历史', 1),
      TabTitle('常发货源', 2),
    ];
  }

  BoxDecoration getBox(int index) {
    var sel = currentPage;
    if (index == 0) {
      return BoxDecoration(
        color: sel == 0 ? ColorConfig.colorfff : ColorConfig.baseColor,
        border: Border.all(width: 0.5, color: ColorConfig.colorfff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      );
    }

    if (index == 2) {
      return BoxDecoration(
        border: Border.all(width: 0.5, color: ColorConfig.colorfff),
        color: sel == 2 ? ColorConfig.colorfff : ColorConfig.baseColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      );
    }

    return BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 0.5, color: ColorConfig.colorfff),
        top: BorderSide(width: 0.5, color: ColorConfig.colorfff),
      ),
      color: sel == 1 ? ColorConfig.colorfff : ColorConfig.baseColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfig.baseColor,
      child: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    color: ColorConfig.baseColor,
                    height: 55,
                    alignment: Alignment.center,
                    child: Container(
                      width: 240,
                      height: 38,
                      child: TabBar(
                        isScrollable: false,
                        controller: mController,
                        labelPadding: EdgeInsets.zero,
                        labelColor: ColorConfig.baseColorDark,
                        indicatorWeight: 0,
                        indicator: ACETabBarIndicator(),
                        unselectedLabelColor: ColorConfig.colorfff,
                        tabs: tabList.map((item) {
                          return Tab(
                            child: Container(
                              width: double.infinity,
                              decoration: getBox(item.id),
                              alignment: Alignment.center,
                              child: Text(
                                item.title,
                                style: TextStyle(fontSize: 16),
                                maxLines: 1,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                      child: PageView(
                    controller: mPageController,
                    onPageChanged: (int index) {
                      if (isPageCanChanged) {
                        //由于PageView切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制PageView的回调
                        onPageChange(index);
                      }
                    },
                    children: [
                      SendGoodList(type: 1),
                      SendGoodList(type: 2),
                      SendGoodList(type: 3),
                    ],
                  ))
                ],
              ),
            ),
            Container(
              width: 80,
              height: 40,
              margin: EdgeInsets.only(bottom: 40),
              child: MyRaisedButton(
                onPressed: (){
                  RouteUtils.go(context, SendCargoKeyString);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: ColorConfig.color_4DA0FF,
                highlightColor: ColorConfig.color6a,
                child: Text(
                  '发货',
                  style: TextStyle(color: ColorConfig.colorfff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
