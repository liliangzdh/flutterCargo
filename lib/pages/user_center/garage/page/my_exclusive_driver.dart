import 'package:cargo_flutter_app/api/user_relation_api.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/config/enum.dart';
import 'package:cargo_flutter_app/model/driver_entity.dart';
import 'package:cargo_flutter_app/pages/user_center/garage/item/driver_item.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/widgets.dart';

/// 专属司机
class MyExclusiveDriver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyExclusiveDriver();
  }
}

class _MyExclusiveDriver extends State<MyExclusiveDriver>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: ColorConfig.color_f4f4f4,
      child: UnitedListView(
        itemBuilder: (List<DriverEntity> list, int index) {
          return DriverItem(list[index],driverType: DriverType.DriverExclusive,);
        },
        pageRequest: (int pageNum, int pageSize) {
          return UserRelationApi.getExclusiveDriverList(pageNum, pageSize);
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
