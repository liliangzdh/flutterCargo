import 'package:cargo_flutter_app/api/driver_car_api.dart';
import 'package:cargo_flutter_app/api/user_relation_api.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/driver_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'item/driver_item.dart';

/// 车源中心
///

class VehicleCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VehicleCenter();
  }
}

class _VehicleCenter extends State<VehicleCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.color_f4f4f4,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConfig.colorfff,
        title: Text('车源中心'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: ColorConfig.color_4DA0FF,
              height: 50,
            ),
            Expanded(
              child: Container(
                child: UnitedListView(
                  itemBuilder: (List<DriverEntity> list, int index) {
                    return DriverItem(list[index]);
                  },
                  pageRequest: (int pageNum, int pageSize) {
                    return DriverCarApi.center(pageNum, pageSize);
                  },
                  fromJson: (dynamic m) {
                    return DriverEntity().fromJson(m);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
