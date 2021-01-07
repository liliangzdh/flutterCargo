import 'package:cargo_flutter_app/model/user_info_entity.dart';

userInfoEntityFromJson(UserInfoEntity data, Map<String, dynamic> json) {
	if (json['bankAccount'] != null) {
		data.bankAccount = json['bankAccount'];
	}
	if (json['businessLicenseUrl'] != null) {
		data.businessLicenseUrl = json['businessLicenseUrl']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['endCardMaturityState'] != null) {
		data.endCardMaturityState = json['endCardMaturityState']?.toInt();
	}
	if (json['headUrl'] != null) {
		data.headUrl = json['headUrl']?.toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['orderVo'] != null) {
		data.orderVo = new UserInfoOrderVo().fromJson(json['orderVo']);
	}
	if (json['spUserAuth'] != null) {
		data.spUserAuth = new UserInfoSpUserAuth().fromJson(json['spUserAuth']);
	}
	if (json['endCardMaturityDay'] != null) {
		data.endCardMaturityDay = json['endCardMaturityDay'];
	}
	if (json['businessLicenseDay'] != null) {
		data.businessLicenseDay = json['businessLicenseDay'];
	}
	if (json['businessLicenseState'] != null) {
		data.businessLicenseState = json['businessLicenseState'];
	}
	if (json['balance'] != null) {
		data.balance = json['balance']?.toDouble();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['goodsBaseList'] != null) {
		data.goodsBaseList = json['goodsBaseList'];
	}
	if (json['caSign'] != null) {
		data.caSign = json['caSign']?.toString();
	}
	if (json['companyAddress'] != null) {
		data.companyAddress = json['companyAddress']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	return data;
}

Map<String, dynamic> userInfoEntityToJson(UserInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['bankAccount'] = entity.bankAccount;
	data['businessLicenseUrl'] = entity.businessLicenseUrl;
	data['companyName'] = entity.companyName;
	data['endCardMaturityState'] = entity.endCardMaturityState;
	data['headUrl'] = entity.headUrl;
	data['mobile'] = entity.mobile;
	if (entity.orderVo != null) {
		data['orderVo'] = entity.orderVo.toJson();
	}
	if (entity.spUserAuth != null) {
		data['spUserAuth'] = entity.spUserAuth.toJson();
	}
	data['endCardMaturityDay'] = entity.endCardMaturityDay;
	data['businessLicenseDay'] = entity.businessLicenseDay;
	data['businessLicenseState'] = entity.businessLicenseState;
	data['balance'] = entity.balance;
	data['createTime'] = entity.createTime;
	data['goodsBaseList'] = entity.goodsBaseList;
	data['caSign'] = entity.caSign;
	data['companyAddress'] = entity.companyAddress;
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['state'] = entity.state;
	data['userType'] = entity.userType;
	return data;
}

userInfoOrderVoFromJson(UserInfoOrderVo data, Map<String, dynamic> json) {
	if (json['amountNum'] != null) {
		data.amountNum = json['amountNum']?.toDouble();
	}
	if (json['orderNum'] != null) {
		data.orderNum = json['orderNum']?.toInt();
	}
	if (json['sendNum'] != null) {
		data.sendNum = json['sendNum']?.toInt();
	}
	return data;
}

Map<String, dynamic> userInfoOrderVoToJson(UserInfoOrderVo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['amountNum'] = entity.amountNum;
	data['orderNum'] = entity.orderNum;
	data['sendNum'] = entity.sendNum;
	return data;
}

userInfoSpUserAuthFromJson(UserInfoSpUserAuth data, Map<String, dynamic> json) {
	if (json['startBusinessLicense'] != null) {
		data.startBusinessLicense = json['startBusinessLicense'];
	}
	if (json['yHCurrencyBalance'] != null) {
		data.yHCurrencyBalance = json['yHCurrencyBalance']?.toDouble();
	}
	if (json['cost'] != null) {
		data.cost = json['cost'];
	}
	if (json['businessLicenseUrl'] != null) {
		data.businessLicenseUrl = json['businessLicenseUrl']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['conName'] != null) {
		data.conName = json['conName']?.toString();
	}
	if (json['idImgFront'] != null) {
		data.idImgFront = json['idImgFront']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['conMobile'] != null) {
		data.conMobile = json['conMobile']?.toString();
	}
	if (json['balance'] != null) {
		data.balance = json['balance']?.toDouble();
	}
	if (json['legalPersonIdentity'] != null) {
		data.legalPersonIdentity = json['legalPersonIdentity']?.toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'];
	}
	if (json['caSign'] != null) {
		data.caSign = json['caSign']?.toString();
	}
	if (json['orgCode'] != null) {
		data.orgCode = json['orgCode']?.toString();
	}
	if (json['companyAddress'] != null) {
		data.companyAddress = json['companyAddress']?.toString();
	}
	if (json['legalPerson'] != null) {
		data.legalPerson = json['legalPerson']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id'];
	}
	if (json['endBusinessLicense'] != null) {
		data.endBusinessLicense = json['endBusinessLicense']?.toString();
	}
	if (json['idImgReverse'] != null) {
		data.idImgReverse = json['idImgReverse']?.toString();
	}
	return data;
}

Map<String, dynamic> userInfoSpUserAuthToJson(UserInfoSpUserAuth entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['startBusinessLicense'] = entity.startBusinessLicense;
	data['yHCurrencyBalance'] = entity.yHCurrencyBalance;
	data['cost'] = entity.cost;
	data['businessLicenseUrl'] = entity.businessLicenseUrl;
	data['companyName'] = entity.companyName;
	data['conName'] = entity.conName;
	data['idImgFront'] = entity.idImgFront;
	data['userId'] = entity.userId;
	data['conMobile'] = entity.conMobile;
	data['balance'] = entity.balance;
	data['legalPersonIdentity'] = entity.legalPersonIdentity;
	data['createTime'] = entity.createTime;
	data['caSign'] = entity.caSign;
	data['orgCode'] = entity.orgCode;
	data['companyAddress'] = entity.companyAddress;
	data['legalPerson'] = entity.legalPerson;
	data['id'] = entity.id;
	data['endBusinessLicense'] = entity.endBusinessLicense;
	data['idImgReverse'] = entity.idImgReverse;
	return data;
}