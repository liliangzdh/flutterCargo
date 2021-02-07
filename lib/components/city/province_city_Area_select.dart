import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/model/city.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/typedef/common.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert' as Json;

import '../ver_line.dart';

/// 省市区 选择。

class ProvinceCityAreaSelect extends StatefulWidget {
  final OnSelectProvinceCityAreaEndClick onSelectProvinceCityAreaEndClick;
  final SelectArea initSelectArea;

  ProvinceCityAreaSelect(
      {this.onSelectProvinceCityAreaEndClick, this.initSelectArea});

  @override
  State<StatefulWidget> createState() {
    return _ProvinceCityAreaSelect();
  }
}

class _ProvinceCityAreaSelect extends State<ProvinceCityAreaSelect> {
  List<Province> provinceList = [];

  TextEditingController controller = TextEditingController();

  // 选中的省，市，县。
  SelectArea selectArea = SelectArea();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    String str = await DefaultAssetBundle.of(context)
        .loadString("assets/json/china_region_last.json");
    var map = Json.jsonDecode(str);
    List<Province> list = new List();
    map.forEach((provinceName, cityList) {
      Province province = Province();
      province.name = provinceName;
      List<City> cityArr = new List();

      cityList.forEach((cityName, areaList) {
        // List<dynamic> 转 List<String>
        List<Area> areaArr = [];
        if (areaList is List) {
          areaList.forEach((element) {
            areaArr.add(Area(element.toString()));
          });
        }
        cityArr.add(City(cityName, areaArr));
      });
      province.cityList = cityArr;
      list.add(province);

      // 默认的数据。
      var initSelectArea = widget.initSelectArea;
      if (initSelectArea != null &&
          initSelectArea.province != null &&
          initSelectArea.province.length > 0) {
        selectArea = SelectArea.createSelectArea(
          initSelectArea.province,
          initSelectArea.city,
          initSelectArea.area,
        );
      } else {
        selectArea = SelectArea.createSelectArea(
          list[0].name,
          list[0].cityList[0].name,
          list[0].cityList[0].areaList[0].name,
        );
      }

      setState(() {
        provinceList = list;
      });
    });
  }

  List<City> getCityListSelect() {
    for (var value in provinceList) {
      if (value.name == selectArea.province) {
        return value.cityList;
      }
    }
    return [];
  }

  List<Area> getAreaListSelect() {
    for (var province in provinceList) {
      if (province.name == selectArea.province) {
        for (var city in province.cityList) {
          if (city.name == selectArea.city) {
            return city.areaList;
          }
        }
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    var cityList = getCityListSelect();
    var areaList = getAreaListSelect();
    print("keyboard:${CommonUtils.getKeyboardHeight(context)}");
    return Container(
      // margin: EdgeInsets.only(bottom: CommonUtils.getScreenHeight(context) *1/3),
      height: CommonUtils.getScreenHeight(context) * 2 / 3 -
          CommonUtils.getStateBarHeight(context) -
          CommonUtils.getStateBottomHeight(context),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            child: Row(
              children: [
                Container(
                  width: 50,
                  child: MyRaisedButton(
                    onPressed: sure,
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '清空',
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
                      '选择装货地',
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
                    onPressed: sure,
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
                Icon(
                  Icons.search,
                  size: 20,
                  color: ColorConfig.color_999,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextField(
                      maxLines: 1,
                      controller: controller,
                      style: TextStyle(
                        color: ColorConfig.color33,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: '搜索城市名称',
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
          Line(),
          Expanded(
            child: Row(
              children: [
                buildListViewCell(provinceList, selectArea.province,
                    color: ColorConfig.color_f4f4f4),
                buildListViewCell(cityList, selectArea.city),
                VerLine(),
                buildListViewCell(areaList, selectArea.area),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onClick(List<dynamic> arr, index) {
    setState(() {
      if (arr is List<Province>) {
        selectArea.province = arr[index].name;
        selectArea.city = arr[index].cityList[0].name;
        selectArea.area = arr[index].cityList[0].areaList[0].name;
      } else if (arr is List<City>) {
        selectArea.city = arr[index].name;
        selectArea.area = arr[index].areaList[0].name;
      } else if (arr is List<Area>) {
        selectArea.area = arr[index].name;
      }
    });
  }

  /// 清空
  /// 确定
  sure() {
    if (widget.onSelectProvinceCityAreaEndClick != null) {
      widget.onSelectProvinceCityAreaEndClick(selectArea);
    }
    RouteUtils.goBack(context);
  }

  buildListViewCell(arr, selectName, {color: ColorConfig.colorfff}) {
    return Expanded(
      child: Container(
        color: color,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: arr.length,
            itemBuilder: (BuildContext context, int index) {
              var bean = arr[index];
              var isSelect = bean.name == selectName;
              return InkWell(
                onTap: () {
                  onClick(arr, index);
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: isSelect ? ColorConfig.colorfff : color,
                  child: Text(
                    '${bean.name}',
                    style: TextStyle(
                      color: isSelect
                          ? ColorConfig.color_4DA0FF
                          : ColorConfig.color66,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
