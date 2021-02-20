import 'package:cargo_flutter_app/utils/common_utils.dart';

class PickerTimeDataUtils {
  /// 获取 装货时间 数据源。
  static List<Map<String, dynamic>> getPickTimeDataResources() {
    // 获取 7天之内的数据。
    List<String> dayArr = [];
    for (var i = 0; i < 7; i++) {
      if (i == 0) {
        dayArr.add('今天');
        dayArr.add('今天或明天');
      } else if (i == 1) {
        dayArr.add('明天');
      } else {
        DateTime dateTime = DateTime.now().add(Duration(days: i));
        dayArr.add(CommonUtils.formatCDate2(dateTime));
      }
    }
    List<Map<String, dynamic>> dataResource = [];

    for (var value in dayArr) {
      Map<String, dynamic> map = {};
      var temp = [
        {
          "凌晨": [
            "都可以",
            "01:00",
            "02:00",
            "03:00",
            "04:00",
            "05:00",
            "06:00",
          ]
        },
        {
          "上午": [
            "都可以",
            "07:00",
            "08:00",
            "09:00",
            "10:00",
            "11:00",
            "12:00",
          ]
        },
        {
          "下午": [
            "都可以",
            "13:00",
            "14:00",
            "15:00",
            "16:00",
            "17:00",
            "18:00",
          ]
        },
        {
          "晚上": [
            "都可以",
            "19:00",
            "20:00",
            "21:00",
            "22:00",
            "23:00",
            "24:00",
          ],
        },
        {
          "全天": ['都可以']
        }
      ];
      if (value == '今天') {
        int hour = DateTime.now().hour;
        var tempArr = [];
        if (hour < 6) {
          tempArr.add({"凌晨": _addToday(temp[0]['凌晨'],0)});
        }
        if (hour < 12) {
          tempArr.add({"上午": _addToday(temp[1]['上午'],6)});
        }
        if (hour < 18) {
          tempArr.add({"下午": _addToday(temp[2]['下午'],12)});
        }
        if (hour < 24) {
          tempArr.add({"晚上": _addToday(temp[3]['晚上'],18)});
        }
        tempArr.add(temp.last);
        map[value] = tempArr;
      } else if (value == '今天或明天') {
        map[value] = [temp.last];
      } else {
        map[value] = temp;
      }
      dataResource.add(map);
    }
    return dataResource;
  }

  static _addToday(List<String> tempApp,int skip) {
    int hour = DateTime.now().hour;
    var arr = [tempApp[0]];
    for (var i = 1; i < tempApp.length; i++) {
      if (i > hour - skip) {
        arr.add(tempApp[i]);
      }
    }
    return arr;
  }
}
