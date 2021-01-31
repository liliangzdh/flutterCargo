import 'package:cargo_flutter_app/eventbus/event.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/common_list_params.dart';
import 'package:cargo_flutter_app/utils/toast_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../loading.dart';

typedef Future<AppResponse> PageRequest(int page, int pageSize);
typedef Widget ItemBuilder<T>(List<T> list, int position);
// map 转 实体类
typedef T FromJson<T>(dynamic map);

/// 通用的ListView (自带 下拉刷新。加载更多)
// Key childKey = Key("UnitedListView");
class UnitedListView<T> extends StatefulWidget {
  final ItemBuilder<T> itemBuilder; //单个样式

  final PageRequest pageRequest;

  final FromJson fromJson;

  final Widget emptyView;

  final int pageSize;
  final int page;

  final bool enablePullDown;
  final bool enablePullUp;

  CommonListParams<T> params;

  UnitedListView({
    Key key,
    @required this.itemBuilder,
    @required this.pageRequest,
    @required this.fromJson,
    this.params,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.emptyView,
    this.pageSize = 10,
    this.page = 1,
  }) : super(key: key);

  @override
  State<UnitedListView> createState() {
    return _UnitedListViewState<T>();
  }
}

class _UnitedListViewState<T> extends State<UnitedListView<T>> {
  List<T> listData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          widget.params != null &&  widget.params.isLoading != null &&
                  !widget.params.isLoading &&
                  listData.length == 0 &&
                  widget.emptyView != null
              ? widget.emptyView
              : Container(),
          SmartRefresher(
            enablePullDown: widget.enablePullDown,
            enablePullUp: widget.enablePullUp,
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return widget.itemBuilder(listData, index);
              },
              itemCount: listData.length,
            ),
          ),
          // Loading(
          //   widget.params.isLoading,
          //   text: widget.params.loadingText,
          //   onTap: () {
          //     // 隐藏
          //   },
          // )
        ],
      ),
    );
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  void _onRefresh() async {
    await getMasterPageList(true);
  }

  void _onLoading() async {
    await getMasterPageList(false);
  }

  @override
  void initState() {
    super.initState();
    pageSize = widget.pageSize;
    pageNum = pageNum;
    if (widget.params == null) {
      widget.params = CommonListParams(listData: List(), isLoading: true);
    }
    listData = widget.params.listData;
  }

  int pageSize = 10;
  int pageNum = 1;
  int totalNum = 0;
  String loadingText;

  Future<AppResponse> loadData(int page, int pageSize) async {
    return await widget.pageRequest(page, pageSize);
  }

  getMasterPageList(bool isRefresh) async {
    if (isRefresh) {
      pageNum = 1;
    } else {
      pageNum++;
    }

    AppResponse res = await loadData(pageNum, pageSize);
    widget.params.isLoading = false;
    setState(() {});

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
    List<T> dataList = list.map<T>((m) => widget.fromJson(m)).toList();

    bool noData;
    var count = res.count;

    if (pageNum == 1) {
      listData.clear();
    }
    if (dataList != null && dataList.length > 0) {
      listData.addAll(dataList);
    }
    setState(() {
      listData = listData;
      totalNum = count;
    });
    noData = listData.length >= count;

    if (isRefresh) {
      _refreshController.refreshCompleted();
    } else {
      //   _controller.loadComplete() 和 _controller.loadNoData() 不能同时调用，
      //   只能调用一次，不然就会出现 hideFooterWhenNotFull 失效的问题。
      if (!noData) {
        _refreshController.loadComplete();
      }
    }

    if (noData) {
      _refreshController.loadNoData();
    } else {
      _refreshController.resetNoData();
    }
  }
}
