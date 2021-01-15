import 'package:cargo_flutter_app/api/goods_resource_api.dart';
import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/components/loading.dart';
import 'package:cargo_flutter_app/components/send/SendGoodItem.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 发货中，发货历史。常发货源。三合一。

class SendGoodList extends StatefulWidget {
  int type;

  SendGoodList({this.type});

  @override
  State<StatefulWidget> createState() {
    return _SendGoodListState(type: this.type);
  }
}

class _SendGoodListState extends State<SendGoodList>
    with AutomaticKeepAliveClientMixin {
  int type;

  _SendGoodListState({this.type});

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: double.infinity,
      color: ColorConfig.color_f4f4f4,
      child: Stack(
        children: [
          !isLoading && listData.length == 0
              ? Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/no_data.png',
                        width: 325,
                        height: 190,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: Text(
                          '您暂时还没有发布的货源哦',
                          style: TextStyle(
                            color: ColorConfig.color33,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return SendGoodItem(
                  type: type,
                  item: listData[index],
                );
              },
              itemCount: listData.length,
            ),
          ),
          Loading(
            isLoading,
            onTap: () {
              // 隐藏
            },
          )
        ],
      ),
    );
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await getMasterPageList(true);
  }

  void _onLoading() async {
    await getMasterPageList(false);
  }

  List<GoodsResourceEntity> listData = [];

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  final int pageSize = 10;
  int pageNum = 1;
  int totalNum = 0;

  getMasterPageList(bool isRefresh) async {
    if (isRefresh) {
      pageNum = 1;
    } else {
      pageNum++;
    }
    AppResponse res = await GoodsResourceApi.getMasterPageList(
        type: type, pageNumber: pageNum, pageSize: pageSize);

    setState(() {
      isLoading = false;
    });

    if (!res.isOk()) {
      ToastUtils.show(msg: res.msg);
      if (isRefresh) {
        _refreshController.refreshFailed();
      } else {
        _refreshController.loadFailed();
      }
      return;
    }

    List<dynamic> list = res.data;

    var dataList =
        list.map((m) => new GoodsResourceEntity().fromJson(m)).toList();

    bool noData;

    if (pageNum == 1) {
      setState(() {
        listData = dataList;
        totalNum = res.count;
      });
      noData = dataList.length >= res.count;
    } else {
      if (dataList != null && dataList.length > 0) {
        listData.addAll(dataList);
      }
      setState(() {
        listData = listData;
        totalNum = res.count;
      });
      noData = listData.length >= res.count;
    }

    if (isRefresh) {
      _refreshController.refreshCompleted();
    } else {
      //   _controller.loadComplete() 和 _controller.loadNoData() 不能同时调用，
      //   只能调用一次，不然就会出现 hideFooterWhenNotFull 失效的问题。
      if(!noData){
        _refreshController.loadComplete();
      }
    }

    if (noData) {
      _refreshController.loadNoData();
    } else {
      _refreshController.resetNoData();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
