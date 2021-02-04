import 'package:cargo_flutter_app/model/driver_entity.dart';

driverEntityFromJson(DriverEntity data, Map<String, dynamic> json) {
	if (json['driverId'] != null) {
		data.driverId = json['driverId']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['headUrl'] != null) {
		data.headUrl = json['headUrl']?.toString();
	}
	if (json['length'] != null) {
		data.length = json['length']?.toString();
	}
	if (json['model'] != null) {
		data.model = json['model']?.toString();
	}
	if (json['num'] != null) {
		data.num = json['num']?.toString();
	}
	if (json['lineList'] != null) {
		data.lineList = new List<dynamic>();
		data.lineList.addAll(json['lineList']);
	}
	if (json['addressesList'] != null) {
		data.addressesList = new List<dynamic>();
		data.addressesList.addAll(json['addressesList']);
	}
	if (json['mord'] != null) {
		data.mord = json['mord']?.toDouble();
	}
	if (json['distance'] != null) {
		data.distance = json['distance']?.toString();
	}
	if (json['agree'] != null) {
		data.agree = json['agree'];
	}
	return data;
}

Map<String, dynamic> driverEntityToJson(DriverEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['driverId'] = entity.driverId;
	data['name'] = entity.name;
	data['mobile'] = entity.mobile;
	data['headUrl'] = entity.headUrl;
	data['length'] = entity.length;
	data['model'] = entity.model;
	data['num'] = entity.num;
	if (entity.lineList != null) {
		data['lineList'] =  [];
	}
	if (entity.addressesList != null) {
		data['addressesList'] =  [];
	}
	data['mord'] = entity.mord;
	data['distance'] = entity.distance;
	data['agree'] = entity.agree;
	return data;
}