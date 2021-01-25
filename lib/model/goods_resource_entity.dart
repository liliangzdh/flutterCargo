import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

class GoodsResourceEntity with JsonConvert<GoodsResourceEntity> {
  String id;
  String fromCity;
  String fromArea;
  String toCity;
  String toArea;
  String goodsName;
  String goodsTypeName;
  String weight;
  String volume;
  double predictPrice;
  String carModel;
  String carLength;
  String isCarType;
  double deposit;
  String fromAreaCode;
  String fromProvince;
  String fromLal;
  String fromAddress;
  String toProvince;
  String toAreaCode;
  String toLal;
  String toAddress;
  String goodsTypeCode;
  String pack;
  String createTime;
  String remarks;
  double distance;
  int isSub;

  String predictSendTimeText;
  String predictSendTimeEnd;

  // 是否常发 0不是 1是
  int isOften;

  getFormatCargoInfoString() {
    var res = '';
    if (goodsName != null && goodsName.length > 0) {
      res += goodsName;
    }

    var carTypeString = '';
    if (isCarType == '1') {
      carTypeString = '整车';
    } else if (isCarType == '2') {
      carTypeString = '零担';
    }
    if (carTypeString.length > 0) {
      res += ' | ';
      res += carTypeString;
    }
    var volumeString = '';
    if (volume != null && volume.length > 0 && double.parse(volume) > 0) {
      volumeString += volume + '方';
    }
    if (weight != null && weight.length > 0 && double.parse(weight) > 0) {
      if (volumeString.length > 0) {
        volumeString += ' ';
      }
      volumeString = volumeString + weight + '吨';
    }

    if (volumeString.length > 0) {
      res += ' | ';
      res += volumeString;
    }

    if (carModel != null && carModel.length > 0) {
      res += ' | ' + carModel;
    }
    if (carLength != null && carLength.length > 0) {
      res += ' | ' + carLength;
    }

    return res;
  }

  getCarString() {
    var res = '';
    if (carModel != null && carModel.length > 0) {
      res += ' , ' + carModel;
    }
    if (carLength != null && carLength.length > 0) {
      res += ' , ' + carLength;
    }
    return res;
  }

  allFromCity() {
    return (fromProvince ?? "") +
        (fromCity ?? "") +
        (fromArea ?? "") +
        (fromAddress ?? "");
  }

  allToCity() {
    return (toProvince ?? "") +
        (toCity ?? "") +
        (toArea ?? "") +
        (toAddress ?? "");
  }
}
