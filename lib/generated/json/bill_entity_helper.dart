import 'package:cargo_flutter_app/model/bill_entity.dart';

billEntityFromJson(BillEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['brId'] != null) {
		data.brId = json['brId']?.toString();
	}
	if (json['isCom'] != null) {
		data.isCom = json['isCom']?.toInt();
	}
	if (json['thirdOrders'] != null) {
		data.thirdOrders = json['thirdOrders']?.toString();
	}
	if (json['payMethod'] != null) {
		data.payMethod = json['payMethod']?.toInt();
	}
	if (json['orderFlow'] != null) {
		data.orderFlow = json['orderFlow']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['totalFee'] != null) {
		data.totalFee = json['totalFee']?.toDouble();
	}
	if (json['resultBalance'] != null) {
		data.resultBalance = json['resultBalance']?.toDouble();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['isSuccess'] != null) {
		data.isSuccess = json['isSuccess']?.toInt();
	}
	if (json['isDeleted'] != null) {
		data.isDeleted = json['isDeleted']?.toInt();
	}
	if (json['explain'] != null) {
		data.explain = json['explain']?.toString();
	}
	if (json['createdBy'] != null) {
		data.createdBy = json['createdBy']?.toString();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toInt();
	}
	if (json['userMobile'] != null) {
		data.userMobile = json['userMobile']?.toString();
	}
	if (json['userName'] != null) {
		data.userName = json['userName']?.toString();
	}
	return data;
}

Map<String, dynamic> billEntityToJson(BillEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['type'] = entity.type;
	data['brId'] = entity.brId;
	data['isCom'] = entity.isCom;
	data['thirdOrders'] = entity.thirdOrders;
	data['payMethod'] = entity.payMethod;
	data['orderFlow'] = entity.orderFlow;
	data['amount'] = entity.amount;
	data['totalFee'] = entity.totalFee;
	data['resultBalance'] = entity.resultBalance;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['isSuccess'] = entity.isSuccess;
	data['isDeleted'] = entity.isDeleted;
	data['explain'] = entity.explain;
	data['createdBy'] = entity.createdBy;
	data['userType'] = entity.userType;
	data['userMobile'] = entity.userMobile;
	data['userName'] = entity.userName;
	return data;
}