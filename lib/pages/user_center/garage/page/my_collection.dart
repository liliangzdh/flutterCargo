import 'package:cargo_flutter_app/api/user_relation_api.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/driver_entity.dart';
import 'package:cargo_flutter_app/pages/user_center/garage/item/driver_item.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 我的收藏。
class MyCollection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCollection();
  }
}

class _MyCollection extends State<MyCollection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: ColorConfig.color_f4f4f4,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: UnitedListView(
        itemBuilder: (List<DriverEntity> list, int index) {
          return DriverItem(list[index]);
        },
        pageRequest: (int pageNum, int pageSize) {
          return UserRelationApi.getCollectionDriverList(pageNum, pageSize);
        },
        fromJson: (dynamic m) {
          return DriverEntity().fromJson(m);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
