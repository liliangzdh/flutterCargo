import 'package:cargo_flutter_app/model/goods_type_entity.dart';

goodsTypeEntityFromJson(GoodsTypeEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['parentId'] != null) {
		data.parentId = json['parentId']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['isHot'] != null) {
		data.isHot = json['isHot']?.toInt();
	}
	if (json['pack'] != null) {
		data.pack = json['pack']?.toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['isDeleted'] != null) {
		data.isDeleted = json['isDeleted']?.toInt();
	}
	if (json['isSys'] != null) {
		data.isSys = json['isSys']?.toInt();
	}
	if (json['parentName'] != null) {
		data.parentName = json['parentName']?.toString();
	}
	return data;
}

Map<String, dynamic> goodsTypeEntityToJson(GoodsTypeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['parentId'] = entity.parentId;
	data['name'] = entity.name;
	data['code'] = entity.code;
	data['isHot'] = entity.isHot;
	data['pack'] = entity.pack;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['isDeleted'] = entity.isDeleted;
	data['isSys'] = entity.isSys;
	data['parentName'] = entity.parentName;
	return data;
}