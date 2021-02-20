
import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/components/modal/common_modal_utils.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/components/word.dart';
import 'package:cargo_flutter_app/model/city.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:cargo_flutter_app/utils/picker_time_data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_picker/flutter_picker.dart';

/// 发布货源
class SendCargo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SendCargo();
  }
}

class _SendCargo extends State<SendCargo> {
  SelectArea fromSelectArea = SelectArea(); // 发货地址
  SelectArea toSelectArea = SelectArea(); // 收货地址

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    CommonUtils.hideKeyboard(context);
    super.dispose();
  }

  // 装货时间选择
  showSelectTime(){
    Picker picker = new Picker(
        adapter: PickerDataAdapter<String>(pickerdata: PickerTimeDataUtils.getPickTimeDataResources()),
        changeToFirst: true,
        textAlign: TextAlign.left,
        height: 250,
        itemExtent:40,
        cancelText: '取消',
        confirmText: '确定',
        columnPadding: const EdgeInsets.all(10.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    );
    picker.showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.color_f4f4f4,
      appBar: AppBar(
        backgroundColor: ColorConfig.colorfff,
        elevation: 0,
        title: Text('发布货源'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(
                        right: 10,
                      ),
                      child: Container(
                        child: MyRaisedButton(
                          color: ColorConfig.color_f4f4f4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '快速重发货源',
                                style: TextStyle(
                                  color: ColorConfig.color_4DA0FF,
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: ColorConfig.color_4DA0FF,
                              )
                            ],
                          ),
                        ),
                        width: 100,
                      ),
                    ),
                    //装货地址信息
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: ColorConfig.colorfff,
                      ),
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Word('装'),
                                Expanded(
                                  child: Column(
                                    children: [
                                      getTopLocation(fromSelectArea, 0),
                                      Line(
                                        height: 1,
                                        margin: EdgeInsets.only(
                                          right: 40,
                                          left: 10,
                                        ),
                                      ),
                                      getTopLocation(fromSelectArea, 0,
                                          isDetail: true)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Line(),
                          Container(
                            child: Row(
                              children: [
                                Word(
                                  '卸',
                                  color: ColorConfig.color_4DA0FF,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      getTopLocation(toSelectArea, 1),
                                      Line(
                                        height: 1,
                                        margin: EdgeInsets.only(
                                          right: 40,
                                          left: 10,
                                        ),
                                      ),
                                      getTopLocation(toSelectArea, 1,
                                          isDetail: true),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 装货时间
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      height: 50,
                      child: MyRaisedButton(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        onPressed: showSelectTime,
                        child: Row(
                          children: [
                            Text('装货时间'),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('06月10日 下午15：00'),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: ColorConfig.color_ccc,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        '完善以下信息找车更精准(选填)',
                        style: TextStyle(color: ColorConfig.color_4DA0FF),
                      ),
                    ),

                    // 完善货物信息
                    getCarInfo('货物信息', 'asadadadadaddadad'),
                    Line(),
                    getCarInfo('车型车长', '121212112'),
                    Line(),
                    getCarInfo('服务要求和备注', '12121'),

                    // 定金 和 钱
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: MyRaisedButton(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: '选填,运费',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: ColorConfig.color_999,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text('元/趟')
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: '选填,定金',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: ColorConfig.color_999,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text('元')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            height: double.infinity,
          ),
          CommonUtils.isKeyboardShow(context)
              ? Container()
              : Container(
                  height: 44,
                  margin:
                      EdgeInsets.only(bottom: CommonUtils.isIphoneX() ? 20 : 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          child: MyRaisedButton(
                            color: ColorConfig.colorfff,
                            child: Text(
                              '指定司机',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          child: MyRaisedButton(
                            color: ColorConfig.color_4DA0FF,
                            highlightColor: ColorConfig.color60,
                            child: Text(
                              '确定发货',
                              style: TextStyle(
                                color: ColorConfig.colorfff,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget getTopLocation(SelectArea city, int type, {bool isDetail = false}) {
    return Container(
      height: 40,
      width: double.infinity,
      color: ColorConfig.color_f4f4f4,
      child: MyRaisedButton(
        onPressed: () {
          if (isDetail) {
            return;
          }
          CommonModalUtils().showProvinceCityAreaSelect(
            context,
            city,
            onSelectClick: (SelectArea selectArea) {
              setState(() {
                switch (type) {
                  case 0:
                    setState(() {
                      fromSelectArea = selectArea;
                    });
                    break;
                  case 1:
                    setState(() {
                      toSelectArea = selectArea;
                    });
                    break;
                }
              });
            },
          );
        },
        child: Container(
          margin: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            '${city.toProvinceCityAreaString()}',
          ),
        ),
      ),
    );
  }

  Widget getCarInfo(String title, String content) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: MyRaisedButton(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 14, top: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Row(
          children: [
            Container(
              child: Text('$title'),
              width: 120,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Text(
                      '$content',
                      style: TextStyle(height: 1.6),
                    )),
                    Padding(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: ColorConfig.color_ccc,
                      ),
                      padding: EdgeInsets.only(left: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
