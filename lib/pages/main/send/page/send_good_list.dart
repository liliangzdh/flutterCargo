import 'package:cargo_flutter_app/api/goods_resource_api.dart';
import 'package:cargo_flutter_app/components/send/SendGoodItem.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/common_list_params.dart';
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


  CommonListParams params = CommonListParams<GoodsResourceEntity>(isLoading: true,listData: List(),loadingText: '加载中...');

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      width: double.infinity,
      color: ColorConfig.color_f4f4f4,
      child: Stack(
        children: [
          UnitedListView<GoodsResourceEntity>(
            params: params,
            itemBuilder: (List<GoodsResourceEntity> list, int index) {
              return new SendGoodItem(
                type: type,
                item: list[index],
                cancelCollectionAction:(){
                  cancelCollectionAction(list[index]);
                },
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


  // 取消收藏
  cancelCollectionAction(GoodsResourceEntity item) async{
    params.loadingText = '取消中';
    params.isLoading = true;
    setState(() {

    });
    await Future.delayed(Duration(seconds: 1));
    print("listData3-----:${params.isLoading}");
    for (var bean in params.listData) {
      if(bean.id == item.id){
        params.listData.remove(bean);
        params.isLoading = false;
        setState(() {

        });
        return;
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
