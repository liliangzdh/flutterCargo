import 'package:cargo_flutter_app/api/goods_resource_api.dart';
import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/components/loading.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:cargo_flutter_app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 货源详情
class CargoDetail extends StatefulWidget {
  final int cargoId;
  final bool isSend; // 是否是正在发货;

  CargoDetail(
      this.cargoId,
      this.isSend, {
        Key key,
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CargoDetailState();
  }
}

class _CargoDetailState extends State<CargoDetail> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
        centerTitle: true,
        backgroundColor: ColorConfig.colorfff,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              color: ColorConfig.color_f4f4f4,
              child: Column(
                children: [
                  Line(),
                  // 位置信息
                  Container(
                    color: ColorConfig.colorfff,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${goodsResourceEntity.fromCity ?? ''}${goodsResourceEntity.fromArea ?? ''} → ${goodsResourceEntity.toCity ?? ""}${goodsResourceEntity.toArea ?? ""}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: '运输预估里程',
                                      style: TextStyle(
                                        color: ColorConfig.color99,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                      '   ${goodsResourceEntity.distance ?? ""}km',
                                      style: TextStyle(
                                        color: ColorConfig.color33,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              Container(
                                height: 24,
                                width: 100,
                                child: MyRaisedButton(
                                  child: Text(
                                    '查看规划路线',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorConfig.color6a,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // 车货信息
                  CommonUtils.isStringEmpty(goodsResourceEntity.carModel) ||
                      CommonUtils.isStringEmpty(
                          goodsResourceEntity.goodsName) ||
                      CommonUtils.isStringEmpty(
                          goodsResourceEntity.goodsTypeName)
                      ? Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    color: ColorConfig.colorfff,
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '车货信息',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        !CommonUtils.isStringEmpty(
                            goodsResourceEntity.carModel)
                            ? Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                '车辆',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorConfig.color99,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  '${goodsResourceEntity.getCarString()}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConfig.color33,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                            : Container(),
                        CommonUtils.isStringEmpty(
                            goodsResourceEntity.goodsName) ||
                            CommonUtils.isStringEmpty(
                                goodsResourceEntity.goodsTypeName)
                            ? Row(
                          children: [
                            Text(
                              '货物',
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorConfig.color99,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                goodsResourceEntity
                                    .getFormatCargoInfoString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorConfig.color33,
                                ),
                              ),
                            ),
                          ],
                        )
                            : Container(),
                      ],
                    ),
                  )
                      : Container(),

                  // 装卸信息
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10),
                    color: ColorConfig.colorfff,
                    child: Column(
                      children: [
                        // 装卸信息头
                        Row(
                          children: [
                            Text(
                              '装卸信息',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/alarm_clock.png',
                                width: 15,
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  CommonUtils.showServerDateTime(
                                    goodsResourceEntity.predictSendTimeText,
                                    goodsResourceEntity.predictSendTimeEnd,
                                  ),
                                  style: TextStyle(
                                    color: ColorConfig.color99,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        loadInfoItem(
                          '装',
                          ColorConfig.color_FF5151,
                          '${goodsResourceEntity.fromCity ?? ''}${goodsResourceEntity.fromArea ?? ''}',
                          goodsResourceEntity.allFromCity(),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: loadInfoItem(
                            '卸',
                            ColorConfig.color_4DA0FF,
                            '${goodsResourceEntity.toCity ?? ''}${goodsResourceEntity.toArea ?? ''}',
                            goodsResourceEntity.allToCity(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 支付信息
                  goodsResourceEntity.deposit != null &&
                      goodsResourceEntity.deposit > 0 ||
                      goodsResourceEntity.predictPrice != null &&
                          goodsResourceEntity.predictPrice > 0
                      ? Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    color: ColorConfig.colorfff,
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '支付信息',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        goodsResourceEntity.predictPrice != null &&
                            goodsResourceEntity.predictPrice > 0
                            ? Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  '预告运费',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorConfig.color99,
                                  ),
                                ),
                                margin: EdgeInsets.only(right: 6),
                                width: 70,
                              ),
                              Text(
                                '${goodsResourceEntity.predictPrice}元',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorConfig.color33,
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                        goodsResourceEntity.deposit != null &&
                            goodsResourceEntity.deposit > 0
                            ? Row(
                          children: [
                            Container(
                              child: Text(
                                '定金',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorConfig.color99,
                                ),
                              ),
                              margin: EdgeInsets.only(right: 6),
                              width: 70,
                            ),
                            Text(
                              '${goodsResourceEntity.deposit}元',
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorConfig.color33,
                              ),
                            )
                          ],
                        )
                            : Container(),
                      ],
                    ),
                  )
                      : Container(),
                ],
              ),
            ),
            widget.isSend
                ? Container(
              height: 44,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: MyRaisedButton(
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        child: Text(
                          '删除货源',
                          style: TextStyle(
                            color: ColorConfig.color_4DA0FF,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyRaisedButton(
                      color: ColorConfig.color_4DA0FF,
                      highlightColor: ColorConfig.color60,
                      child: Container(
                        height: double.infinity,
                        child: Text(
                          '指定承运',
                          style: TextStyle(
                            color: ColorConfig.colorfff,
                            fontSize: 16,
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
                : Container(),
            Loading(isLoading),
          ],
        ),
      ),
    );
  }

  /// 装卸 信息。
  Widget loadInfoItem(
      String title, Color color, String fromCity, String detailArea) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 6),
          padding: EdgeInsets.only(left: 4, right: 4, bottom: 3, top: 3),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: ColorConfig.colorfff,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fromCity,
              style: TextStyle(color: ColorConfig.color33, fontSize: 16),
            ),
            Padding(
              child: Text(
                detailArea,
                style: TextStyle(color: ColorConfig.color99, fontSize: 14),
              ),
              padding: EdgeInsets.only(top: 4),
            )
          ],
        )
      ],
    );
  }

  GoodsResourceEntity goodsResourceEntity = GoodsResourceEntity();

  @override
  void initState() {
    super.initState();
    getDetail();
  }

  getDetail() async {
    AppResponse appResponse =
    await GoodsResourceApi.getMasterGoods(id: widget.cargoId);
    if (!mounted) {
      return;
    }
    if (!appResponse.isOk()) {
      ToastUtils.show(msg: appResponse.msg);
      hideLoading();
      return;
    }
    goodsResourceEntity = GoodsResourceEntity().fromJson(appResponse.data);

    hideLoading();
  }

  hideLoading() {
    setState(() {
      isLoading = false;
    });
  }
}
