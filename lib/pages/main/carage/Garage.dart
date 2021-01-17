import 'package:cargo_flutter_app/api/goods_resource_api.dart';
import 'package:cargo_flutter_app/components/send/SendGoodItem.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Garage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Garage();
  }
}

class _Garage extends State<Garage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('车辆管理'),
        centerTitle: true,
      ),
      body: Container(
        child: UnitedListView<GoodsResourceEntity>(
          itemBuilder: (List<GoodsResourceEntity> list, int index) {
            return new SendGoodItem(
              type: 2,
              item: list[index],
            );
          },
          pageRequest: (int pageNum, int pageSize) {
            return GoodsResourceApi.getMasterPageList(
                type: 1, pageNumber: pageNum, pageSize: pageSize);
          },
          fromJson: (dynamic m) {
            return GoodsResourceEntity().fromJson(m);
          },
        ),
      ),
    );
  }
}
