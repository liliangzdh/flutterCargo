import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/model/city.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert' as Json;

import '../ver_line.dart';

/// 省市区 选择。

class ProvinceCityAreaSelect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProvinceCityAreaSelect();
  }
}

class _ProvinceCityAreaSelect extends State<ProvinceCityAreaSelect> {
  List<Province> provinceList = [];

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
      if (list.length == 4) {
        province.isSelect = true;
        province.cityList[0].isSelect = true;
      }
      setState(() {
        provinceList = list;
      });
    });
  }

  List<City> getCityListSelect() {
    for (var value in provinceList) {
      if (value.isSelect) {
        return value.cityList;
      }
    }
    return [];
  }

  List<Area> getAreaListSelect() {
    for (var province in provinceList) {
      if (province.isSelect) {
        for (var city in province.cityList) {
          if (city.isSelect) {
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
    return Container(
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
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '清空',
                      style: TextStyle(color: ColorConfig.color_999),
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
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '确定',
                      style: TextStyle(color: ColorConfig.color_4DA0FF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Line(),
          Container(
            height: 40,
            child: Row(),
          ),
          Line(),
          Expanded(
            child: Row(
              children: [
                buildListViewCell(provinceList,
                    color: ColorConfig.color_f4f4f4),
                buildListViewCell(cityList),
                VerLine(),
                buildListViewCell(areaList),
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
        for (var i = 0; i < arr.length; i++) {
          arr[i].isSelect = i == index;
          var cityList = arr[i].cityList;
          for (var i = 0; i < cityList.length; i++) {
            cityList[i].isSelect = false;
            var areaList = cityList[i].areaList;
            for (var i = 0; i < areaList.length; i++) {
              areaList[i].isSelect = false;
            }
          }
        }

        arr[index].cityList[0].isSelect = true;
        arr[index].cityList[0].areaList[0].isSelect = true;

      } else if (arr is List<City>) {
        for (var i = 0; i < arr.length; i++) {
          arr[i].isSelect = i == index;
          var areaList = arr[i].areaList;
          for (var i = 0; i < areaList.length; i++) {
            areaList[i].isSelect = false;
          }
        }
        // 默认 选择 区域 第一个。
        arr[index].areaList[0].isSelect = true;
      } else if (arr is List<Area>) {
        for (var i = 0; i < arr.length; i++) {
          arr[i].isSelect = i == index;
        }
      }
    });
  }

  buildListViewCell(arr, {color: ColorConfig.colorfff}) {
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
              return InkWell(
                onTap: () {
                  onClick(arr, index);
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: bean.isSelect ? ColorConfig.colorfff : color,
                  child: Text(
                    '${bean.name}',
                    style: TextStyle(
                      color: bean.isSelect
                          ? ColorConfig.color_4DA0FF
                          : ColorConfig.color66,
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
