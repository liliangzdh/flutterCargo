import 'package:cargo_flutter_app/model/user_info_entity.dart';

userInfoEntityFromJson(UserInfoEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['headUrl'] != null) {
		data.headUrl = json['headUrl']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['caSign'] != null) {
		data.caSign = json['caSign']?.toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['loginTime'] != null) {
		data.loginTime = json['loginTime']?.toString();
	}
	if (json['loginNum'] != null) {
		data.loginNum = json['loginNum']?.toInt();
	}
	if (json['reCode'] != null) {
		data.reCode = json['reCode']?.toString();
	}
	if (json['baseId'] != null) {
		data.baseId = json['baseId']?.toString();
	}
	if (json['idImgFront'] != null) {
		data.idImgFront = json['idImgFront']?.toString();
	}
	if (json['idImgReverse'] != null) {
		data.idImgReverse = json['idImgReverse']?.toString();
	}
	if (json['idImgHolding'] != null) {
		data.idImgHolding = json['idImgHolding']?.toString();
	}
	if (json['startCardValidity'] != null) {
		data.startCardValidity = json['startCardValidity']?.toString();
	}
	if (json['endCardValidity'] != null) {
		data.endCardValidity = json['endCardValidity']?.toString();
	}
	if (json['num'] != null) {
		data.num = json['num']?.toDouble();
	}
	if (json['isFreeze'] != null) {
		data.isFreeze = json['isFreeze']?.toInt();
	}
	if (json['cost'] != null) {
		data.cost = json['cost']?.toDouble();
	}
	if (json['rid'] != null) {
		data.rid = json['rid']?.toString();
	}
	return data;
}

Map<String, dynamic> userInfoEntityToJson(UserInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['mobile'] = entity.mobile;
	data['headUrl'] = entity.headUrl;
	data['state'] = entity.state;
	data['userType'] = entity.userType;
	data['caSign'] = entity.caSign;
	data['createTime'] = entity.createTime;
	data['loginTime'] = entity.loginTime;
	data['loginNum'] = entity.loginNum;
	data['reCode'] = entity.reCode;
	data['baseId'] = entity.baseId;
	data['idImgFront'] = entity.idImgFront;
	data['idImgReverse'] = entity.idImgReverse;
	data['idImgHolding'] = entity.idImgHolding;
	data['startCardValidity'] = entity.startCardValidity;
	data['endCardValidity'] = entity.endCardValidity;
	data['num'] = entity.num;
	data['isFreeze'] = entity.isFreeze;
	data['cost'] = entity.cost;
	data['rid'] = entity.rid;
	return data;
}