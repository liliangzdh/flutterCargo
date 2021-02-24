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
          tempArr.add({"凌晨": _addToday(temp[0]['凌晨'], 0)});
        }
        if (hour < 12) {
          tempArr.add({"上午": _addToday(temp[1]['上午'], 6)});
        }
        if (hour < 18) {
          tempArr.add({"下午": _addToday(temp[2]['下午'], 12)});
        }
        if (hour < 24) {
          tempArr.add({"晚上": _addToday(temp[3]['晚上'], 18)});
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

  static _addToday(List<String> tempApp, int skip) {
    int hour = DateTime.now().hour;
    var arr = [tempApp[0]];
    for (var i = 1; i < tempApp.length; i++) {
      if (i > hour - skip) {
        arr.add(tempApp[i]);
      }
    }
    return arr;
  }

  /**
   * APP展示选择器选完之后时间
   */
  static showPickerDateTime(dateStrArr) {
    var dateStr = '';
    if (dateStrArr.length == 3) {
      var timeStr1 = dateStrArr[0];
      var timeStr2 = dateStrArr[1];
      var timeStr3 = dateStrArr[2];
      dateStr = timeStr1 + timeStr2 + timeStr3;
      if (timeStr2 == '凌晨' && timeStr3 == '都可以') {
        dateStr = timeStr1 + ' ' + timeStr2 + ' ' + '1:00-6:00';
      } else if (timeStr2 == '上午' && timeStr3 == '都可以') {
        dateStr = timeStr1 + ' ' + timeStr2 + ' ' + '7:00-12:00';
      } else if (timeStr2 == '下午' && timeStr3 == '都可以') {
        dateStr = timeStr1 + ' ' + timeStr2 + ' ' + '13:00-18:00';
      } else if (timeStr2 == '晚上' && timeStr3 == '都可以') {
        dateStr = timeStr1 + ' ' + timeStr2 + ' ' + '19:00-24:00';
      } else if (timeStr2 == '全天') {
        dateStr = timeStr1 + ' ' + timeStr2 + ' ' + '0:00-24:00';
      }
    }
    return dateStr;
  }

  /**
   * 向后端发送的时间
   * @param {选择时间数组} dateStrArr
   */
  static sendDateTime(dateStrArr) {
    var dateStr = '';
    if (dateStrArr.length == 3) {
      var timeStr1 = dateStrArr[0];
      if (timeStr1 == '今天') {
        timeStr1 = CommonUtils.formatCDate3(DateTime.now());
      } else if (timeStr1 == '今天或明天' || timeStr1 == '明天') {
        timeStr1 =
            CommonUtils.formatCDate3(DateTime.now().add(Duration(days: 1)));
      } else {
        if (!timeStr1.contains("年")) {
          timeStr1 = DateTime.now().year.toString() + "年";
        }
        timeStr1 = CommonUtils.formatCDateByString(timeStr1);
      }

      var timeStr2 = dateStrArr[1];
      var timeStr3 = dateStrArr[2];

      if (timeStr2 == '凌晨' && timeStr3 == '都可以') {
        dateStr = timeStr1 + ' 06:00:00';
      } else if (timeStr2 == '上午' && timeStr3 == '都可以') {
        dateStr = timeStr1 + ' 12:00:00';
      } else if (timeStr2 == '下午' && timeStr3 == '都可以') {
        dateStr = timeStr1 + ' 18:00:00';
      } else if (timeStr2 == '晚上' && timeStr3 == '都可以') {
        dateStr = timeStr1 + ' 23:59:00';
      } else if (timeStr2 == '全天') {
        dateStr = timeStr1 + ' 23:59:00';
      } else {
        dateStr = timeStr1 + ' ' + timeStr3 + ':00';
      }
    }
    return dateStr;
  }

  /**
   * 保存时间样式字段
   * @param {选择时间数组} dateStrArr
   */
  static saveSendTimeText(dateStrArr) {
    var dateFormatType = 0;
    if (dateStrArr.length == 3) {
      var timeStr2 = dateStrArr[1];
      var timeStr3 = dateStrArr[2];
      if (dateStrArr[0] == '今天或明天') {
        dateFormatType = 6;
      } else if (timeStr2 == '凌晨' && timeStr3 == '都可以') {
        dateFormatType = 1;
      } else if (timeStr2 == '上午' && timeStr3 == '都可以') {
        dateFormatType = 2;
      } else if (timeStr2 == '下午' && timeStr3 == '都可以') {
        dateFormatType = 3;
      } else if (timeStr2 == '晚上' && timeStr3 == '都可以') {
        dateFormatType = 4;
      } else if (timeStr2 == '全天') {
        dateFormatType = 5;
      }
    }
    return dateFormatType;
  }
}
