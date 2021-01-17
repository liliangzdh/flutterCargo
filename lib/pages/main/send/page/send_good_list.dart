import 'package:cargo_flutter_app/api/goods_resource_api.dart';
import 'package:cargo_flutter_app/components/send/SendGoodItem.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          UnitedListView<GoodsResourceEntity>(
            itemBuilder: (List<GoodsResourceEntity> list, int index) {
              return new SendGoodItem(
                type: 2,
                item: list[index],
              );
            },
            pageRequest: (int pageNum, int pageSize) {
              return GoodsResourceApi.getMasterPageList(
                  type: type, pageNumber: pageNum, pageSize: pageSize);
            },
            emptyView: Container(
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
            ),
            fromJson: (dynamic m) {
              return GoodsResourceEntity().fromJson(m);
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
