import 'package:cargo_flutter_app/model/goods_resource_entity.dart';

goodsResourceEntityFromJson(GoodsResourceEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['fromCity'] != null) {
		data.fromCity = json['fromCity']?.toString();
	}
	if (json['fromArea'] != null) {
		data.fromArea = json['fromArea']?.toString();
	}
	if (json['toCity'] != null) {
		data.toCity = json['toCity']?.toString();
	}
	if (json['toArea'] != null) {
		data.toArea = json['toArea']?.toString();
	}
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName']?.toString();
	}
	if (json['goodsTypeName'] != null) {
		data.goodsTypeName = json['goodsTypeName']?.toString();
	}
	if (json['weight'] != null) {
		data.weight = json['weight']?.toString();
	}
	if (json['volume'] != null) {
		data.volume = json['volume']?.toString();
	}
	if (json['predictPrice'] != null) {
		data.predictPrice = json['predictPrice']?.toDouble();
	}
	if (json['carModel'] != null) {
		data.carModel = json['carModel']?.toString();
	}
	if (json['carLength'] != null) {
		data.carLength = json['carLength']?.toString();
	}
	if (json['isCarType'] != null) {
		data.isCarType = json['isCarType']?.toString();
	}
	if (json['deposit'] != null) {
		data.deposit = json['deposit']?.toDouble();
	}
	if (json['fromAreaCode'] != null) {
		data.fromAreaCode = json['fromAreaCode']?.toString();
	}
	if (json['fromProvince'] != null) {
		data.fromProvince = json['fromProvince']?.toString();
	}
	if (json['fromLal'] != null) {
		data.fromLal = json['fromLal']?.toString();
	}
	if (json['fromAddress'] != null) {
		data.fromAddress = json['fromAddress']?.toString();
	}
	if (json['toProvince'] != null) {
		data.toProvince = json['toProvince']?.toString();
	}
	if (json['toAreaCode'] != null) {
		data.toAreaCode = json['toAreaCode']?.toString();
	}
	if (json['toLal'] != null) {
		data.toLal = json['toLal']?.toString();
	}
	if (json['toAddress'] != null) {
		data.toAddress = json['toAddress']?.toString();
	}
	if (json['goodsTypeCode'] != null) {
		data.goodsTypeCode = json['goodsTypeCode']?.toString();
	}
	if (json['pack'] != null) {
		data.pack = json['pack']?.toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['remarks'] != null) {
		data.remarks = json['remarks']?.toString();
	}
	if (json['distance'] != null) {
		data.distance = json['distance']?.toDouble();
	}
	if (json['isSub'] != null) {
		data.isSub = json['isSub']?.toInt();
	}
	if (json['predictSendTimeText'] != null) {
		data.predictSendTimeText = json['predictSendTimeText']?.toString();
	}
	if (json['predictSendTimeEnd'] != null) {
		data.predictSendTimeEnd = json['predictSendTimeEnd']?.toString();
	}
	if (json['isOften'] != null) {
		data.isOften = json['isOften']?.toInt();
	}
	return data;
}

Map<String, dynamic> goodsResourceEntityToJson(GoodsResourceEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['fromCity'] = entity.fromCity;
	data['fromArea'] = entity.fromArea;
	data['toCity'] = entity.toCity;
	data['toArea'] = entity.toArea;
	data['goodsName'] = entity.goodsName;
	data['goodsTypeName'] = entity.goodsTypeName;
	data['weight'] = entity.weight;
	data['volume'] = entity.volume;
	data['predictPrice'] = entity.predictPrice;
	data['carModel'] = entity.carModel;
	data['carLength'] = entity.carLength;
	data['isCarType'] = entity.isCarType;
	data['deposit'] = entity.deposit;
	data['fromAreaCode'] = entity.fromAreaCode;
	data['fromProvince'] = entity.fromProvince;
	data['fromLal'] = entity.fromLal;
	data['fromAddress'] = entity.fromAddress;
	data['toProvince'] = entity.toProvince;
	data['toAreaCode'] = entity.toAreaCode;
	data['toLal'] = entity.toLal;
	data['toAddress'] = entity.toAddress;
	data['goodsTypeCode'] = entity.goodsTypeCode;
	data['pack'] = entity.pack;
	data['createTime'] = entity.createTime;
	data['remarks'] = entity.remarks;
	data['distance'] = entity.distance;
	data['isSub'] = entity.isSub;
	data['predictSendTimeText'] = entity.predictSendTimeText;
	data['predictSendTimeEnd'] = entity.predictSendTimeEnd;
	data['isOften'] = entity.isOften;
	return data;
}