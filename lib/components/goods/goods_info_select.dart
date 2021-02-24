import 'package:cargo_flutter_app/api/goods_type_api.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/goods_type_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:cargo_flutter_app/utils/share_perference_utils.dart';
import 'package:flutter/material.dart';

import '../line.dart';
import '../raised_button.dart';

/// 货物信息 选择

class GoodsInfoSelect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoodsInfoSelect();
  }
}

class _GoodsInfoSelect extends State<GoodsInfoSelect> {
  TextEditingController controller = TextEditingController();

  List<GoodsTypeEntity> goodsTypeList = [];
  List<GoodsTypeEntity> hisGoodTypeList = [];
  List<GoodsTypeEntity> searchGoodTypeList = [];

  @override
  void initState() {
    super.initState();
    getHotGoodsTypeList();
  }

  getHotGoodsTypeList() async {
    // 获取 历史
    List<GoodsTypeEntity> hisGoodTypeListData =
        await SharePreferenceUtils.getHistoryGoodInfoList();
    setState(() {
      hisGoodTypeList = hisGoodTypeListData;
    });
    AppResponse response = await GoodsTypeApi.getHotGoodsTypeList();
    if (response.isOk()) {
      setState(() {
        goodsTypeList = response.data
            .map<GoodsTypeEntity>((e) => GoodsTypeEntity().fromJson(e))
            .toList();

        //  手动保存两个。
        // SharePreferenceUtils.saveHistoryGoodInfoList([goodsTypeList[0],goodsTypeList[1]]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CommonUtils.getScreenHeight(context) * 2 / 3,
      child: Column(
        children: [
          // 头部
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            child: Row(
              children: [
                Container(
                  width: 50,
                  child: MyRaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '关闭',
                      style: TextStyle(
                        color: ColorConfig.color_999,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      '货物信息',
                      style: TextStyle(
                        color: ColorConfig.color00,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                  width: 50,
                  child: MyRaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '确定',
                      style: TextStyle(
                        color: ColorConfig.color_4DA0FF,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Line(),

          Expanded(child:  buildNormal())
        ],
      ),
    );
  }

  /// 进来显示 的 默认
  Widget buildNormal() {
    return Container(
      child: Column(
        children: [
          // 搜索
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: ColorConfig.color_f4f4f4,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      maxLines: 1,
                      controller: controller,
                      onChanged: onSearchTextChange,
                      style: TextStyle(
                        color: ColorConfig.color33,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: '搜索',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: ColorConfig.color_999,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        isCollapsed: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: buildSearch(),),
        ],
      ),
    );
  }

  Widget buildSearch() {
    if (searchGoodTypeList.length > 0) {
      return Container(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var item = searchGoodTypeList[index];
              return Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                padding: EdgeInsets.only(top: 10,bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorConfig.color_ccc,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '${item.name}',
                      style: TextStyle(color: ColorConfig.color00),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${item.parentName}",
                          style: TextStyle(
                            color: ColorConfig.color00,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: searchGoodTypeList.length,
          ),
        ),
      );
    }
    return Container(
      child: Column(
        children: [
          // 历史类型 标题
          Container(
            height: 30,
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '历史搜索',
                  style: TextStyle(
                    color: ColorConfig.color00,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete_forever,
                          size: 20,
                          color: ColorConfig.color_999,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // 历史标签。流式布局
          buildWrapList(hisGoodTypeList),
          // 热门类型 标题
          Container(
            height: 30,
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '热门类型',
                  style: TextStyle(
                    color: ColorConfig.color00,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '更多',
                          style: TextStyle(
                            color: ColorConfig.color_999,
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                          color: ColorConfig.color_999,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // 热门标签。流式布局
          buildWrapList(goodsTypeList),
        ],
      ),
    );
  }

  Widget buildWrapList(list) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      textDirection: TextDirection.ltr,
      children: list
          .map<Widget>(
            (e) => Container(
              child: Text('${e.name}'),
              decoration: BoxDecoration(
                color: ColorConfig.color_f7f7f7,
                borderRadius: BorderRadius.circular(2),
              ),
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: 10,
              ),
            ),
          )
          .toList(),
    );
  }

  onSearchTextChange(String str) async {
    if (str.length == 0) {
      setState(() {
        searchGoodTypeList = [];
      });
      return;
    }
    AppResponse res = await GoodsTypeApi.searchGoodTypeList(key: str);
    setState(() {
      if (res.isOk()) {
        List<GoodsTypeEntity> arr = [];
        for (var map in res.data) {
          arr.addAll(map['childList']
              .map<GoodsTypeEntity>((e) => GoodsTypeEntity().fromJson(e))
              .toList());
        }
        searchGoodTypeList = arr;
      } else {
        searchGoodTypeList = [];
      }
    });
  }
}
