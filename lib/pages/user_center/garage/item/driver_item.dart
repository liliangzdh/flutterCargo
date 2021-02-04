import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/components/my_clipper.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/config/config.dart';
import 'package:cargo_flutter_app/config/enum.dart';
import 'package:cargo_flutter_app/model/driver_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DriverItem extends StatelessWidget {
  final DriverEntity entity;
  final DriverType driverType;

  DriverItem(this.entity, {this.driverType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: MyRaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        color: ColorConfig.colorfff,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  ClipOval(
                    clipper: MyClipper(2),
                    child: entity.headUrl == null || entity.headUrl.length == 0
                        ? Image.asset(
                            "assets/images/logo.png",
                            width: 36,
                            height: 36,
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            "${UrlConfig.ImageBaseUlr}${entity.headUrl}",
                            width: 36,
                            height: 36,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Padding(
                    child: Text(
                      '${entity.name}',
                      style: TextStyle(color: ColorConfig.color_555555),
                    ),
                    padding: EdgeInsets.only(left: 5),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 2,
                      bottom: 2,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConfig.color_4DA0FF,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      '${entity.num}',
                      style: TextStyle(
                        color: ColorConfig.colorfff,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${entity.model} ${entity.length} ',
                        style: TextStyle(color: ColorConfig.color_555555),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Line(),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  entity.mord != null && entity.mord > 0
                      ? Image.asset(
                          'assets/images/star_sel.png',
                          width: 15,
                          height: 15,
                        )
                      : Container(),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      '${entity.mord ?? '暂无评分'}',
                      style: TextStyle(
                        color: ColorConfig.color_FFB43A,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  driverType == DriverType.DriverExclusive && !entity.agree
                      ? Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.only(
                              left: 6, right: 6, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                            color: ColorConfig.color_FFB43A,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            '申请中',
                            style: TextStyle(
                              color: ColorConfig.colorfff,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 50,
                        height: 30,
                        child: MyRaisedButton(
                          onPressed: (){
                            CommonUtils.phoneCall(entity.mobile);
                          },
                          child: Image.asset(
                            'assets/images/callPhone.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
