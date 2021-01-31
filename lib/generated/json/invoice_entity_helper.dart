import 'package:cargo_flutter_app/model/invoice_entity.dart';

invoiceEntityFromJson(InvoiceEntity data, Map<String, dynamic> json) {
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toInt();
	}
	if (json['fromLimit'] != null) {
		data.fromLimit = json['fromLimit'];
	}
	if (json['toLimit'] != null) {
		data.toLimit = json['toLimit'];
	}
	if (json['fromLal'] != null) {
		data.fromLal = json['fromLal']?.toString();
	}
	if (json['toLal'] != null) {
		data.toLal = json['toLal']?.toString();
	}
	if (json['fromProvince'] != null) {
		data.fromProvince = json['fromProvince']?.toString();
	}
	if (json['fromCity'] != null) {
		data.fromCity = json['fromCity']?.toString();
	}
	if (json['fromArea'] != null) {
		data.fromArea = json['fromArea']?.toString();
	}
	if (json['fromAreaCode'] != null) {
		data.fromAreaCode = json['fromAreaCode'];
	}
	if (json['toAddress'] != null) {
		data.toAddress = json['toAddress']?.toString();
	}
	if (json['fromAddress'] != null) {
		data.fromAddress = json['fromAddress']?.toString();
	}
	if (json['toProvince'] != null) {
		data.toProvince = json['toProvince']?.toString();
	}
	if (json['toCity'] != null) {
		data.toCity = json['toCity']?.toString();
	}
	if (json['toArea'] != null) {
		data.toArea = json['toArea']?.toString();
	}
	if (json['toAreaCode'] != null) {
		data.toAreaCode = json['toAreaCode'];
	}
	if (json['isCarType'] != null) {
		data.isCarType = json['isCarType'];
	}
	if (json['carLength'] != null) {
		data.carLength = json['carLength']?.toString();
	}
	if (json['carModel'] != null) {
		data.carModel = json['carModel']?.toString();
	}
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName']?.toString();
	}
	if (json['weight'] != null) {
		data.weight = json['weight']?.toString();
	}
	if (json['volume'] != null) {
		data.volume = json['volume']?.toString();
	}
	if (json['distance'] != null) {
		data.distance = json['distance']?.toString();
	}
	if (json['sendTime'] != null) {
		data.sendTime = json['sendTime']?.toString();
	}
	if (json['sendTimeText'] != null) {
		data.sendTimeText = json['sendTimeText'];
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price'];
	}
	if (json['loadMode'] != null) {
		data.loadMode = json['loadMode']?.toString();
	}
	if (json['isCom'] != null) {
		data.isCom = json['isCom']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toString();
	}
	if (json['putUserId'] != null) {
		data.putUserId = json['putUserId']?.toInt();
	}
	if (json['isDown'] != null) {
		data.isDown = json['isDown']?.toInt();
	}
	if (json['down'] != null) {
		data.down = json['down']?.toDouble();
	}
	if (json['orderNum'] != null) {
		data.orderNum = json['orderNum']?.toString();
	}
	if (json['remarks'] != null) {
		data.remarks = json['remarks']?.toString();
	}
	if (json['payMethod'] != null) {
		data.payMethod = json['payMethod'];
	}
	if (json['isAssign'] != null) {
		data.isAssign = json['isAssign']?.toInt();
	}
	if (json['spUserId'] != null) {
		data.spUserId = json['spUserId']?.toInt();
	}
	if (json['isDVal'] != null) {
		data.isDVal = json['isDVal']?.toInt();
	}
	if (json['isSVal'] != null) {
		data.isSVal = json['isSVal']?.toInt();
	}
	if (json['isInvoice'] != null) {
		data.isInvoice = json['isInvoice']?.toInt();
	}
	if (json['isPay'] != null) {
		data.isPay = json['isPay']?.toInt();
	}
	if (json['isPut'] != null) {
		data.isPut = json['isPut']?.toInt();
	}
	if (json['driverState'] != null) {
		data.driverState = json['driverState']?.toInt();
	}
	if (json['driverId'] != null) {
		data.driverId = json['driverId']?.toInt();
	}
	if (json['driverCarModel'] != null) {
		data.driverCarModel = json['driverCarModel'];
	}
	if (json['driverCarLength'] != null) {
		data.driverCarLength = json['driverCarLength'];
	}
	if (json['loadTime'] != null) {
		data.loadTime = json['loadTime'];
	}
	if (json['unloadingTime'] != null) {
		data.unloadingTime = json['unloadingTime']?.toString();
	}
	if (json['driverName'] != null) {
		data.driverName = json['driverName']?.toString();
	}
	if (json['driverCarNum'] != null) {
		data.driverCarNum = json['driverCarNum']?.toString();
	}
	if (json['driverCarMobile'] != null) {
		data.driverCarMobile = json['driverCarMobile']?.toString();
	}
	if (json['driverHeadUrl'] != null) {
		data.driverHeadUrl = json['driverHeadUrl']?.toString();
	}
	if (json['toName'] != null) {
		data.toName = json['toName']?.toString();
	}
	if (json['toMobile'] != null) {
		data.toMobile = json['toMobile']?.toString();
	}
	if (json['fromName'] != null) {
		data.fromName = json['fromName']?.toString();
	}
	if (json['fromMobile'] != null) {
		data.fromMobile = json['fromMobile']?.toString();
	}
	if (json['goodsValue'] != null) {
		data.goodsValue = json['goodsValue'];
	}
	if (json['isRefund'] != null) {
		data.isRefund = json['isRefund'];
	}
	if (json['isPod'] != null) {
		data.isPod = json['isPod'];
	}
	if (json['goodsType'] != null) {
		data.goodsType = json['goodsType'];
	}
	if (json['goodsTypeName'] != null) {
		data.goodsTypeName = json['goodsTypeName'];
	}
	if (json['isCompanyPay'] != null) {
		data.isCompanyPay = json['isCompanyPay'];
	}
	if (json['pack'] != null) {
		data.pack = json['pack'];
	}
	if (json['insureStatus'] != null) {
		data.insureStatus = json['insureStatus'];
	}
	if (json['invoiceState'] != null) {
		data.invoiceState = json['invoiceState'];
	}
	if (json['totalCharge'] != null) {
		data.totalCharge = json['totalCharge']?.toDouble();
	}
	if (json['spUserName'] != null) {
		data.spUserName = json['spUserName']?.toString();
	}
	return data;
}

Map<String, dynamic> invoiceEntityToJson(InvoiceEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['goodsId'] = entity.goodsId;
	data['fromLimit'] = entity.fromLimit;
	data['toLimit'] = entity.toLimit;
	data['fromLal'] = entity.fromLal;
	data['toLal'] = entity.toLal;
	data['fromProvince'] = entity.fromProvince;
	data['fromCity'] = entity.fromCity;
	data['fromArea'] = entity.fromArea;
	data['fromAreaCode'] = entity.fromAreaCode;
	data['toAddress'] = entity.toAddress;
	data['fromAddress'] = entity.fromAddress;
	data['toProvince'] = entity.toProvince;
	data['toCity'] = entity.toCity;
	data['toArea'] = entity.toArea;
	data['toAreaCode'] = entity.toAreaCode;
	data['isCarType'] = entity.isCarType;
	data['carLength'] = entity.carLength;
	data['carModel'] = entity.carModel;
	data['goodsName'] = entity.goodsName;
	data['weight'] = entity.weight;
	data['volume'] = entity.volume;
	data['distance'] = entity.distance;
	data['sendTime'] = entity.sendTime;
	data['sendTimeText'] = entity.sendTimeText;
	data['createTime'] = entity.createTime;
	data['price'] = entity.price;
	data['loadMode'] = entity.loadMode;
	data['isCom'] = entity.isCom;
	data['state'] = entity.state;
	data['putUserId'] = entity.putUserId;
	data['isDown'] = entity.isDown;
	data['down'] = entity.down;
	data['orderNum'] = entity.orderNum;
	data['remarks'] = entity.remarks;
	data['payMethod'] = entity.payMethod;
	data['isAssign'] = entity.isAssign;
	data['spUserId'] = entity.spUserId;
	data['isDVal'] = entity.isDVal;
	data['isSVal'] = entity.isSVal;
	data['isInvoice'] = entity.isInvoice;
	data['isPay'] = entity.isPay;
	data['isPut'] = entity.isPut;
	data['driverState'] = entity.driverState;
	data['driverId'] = entity.driverId;
	data['driverCarModel'] = entity.driverCarModel;
	data['driverCarLength'] = entity.driverCarLength;
	data['loadTime'] = entity.loadTime;
	data['unloadingTime'] = entity.unloadingTime;
	data['driverName'] = entity.driverName;
	data['driverCarNum'] = entity.driverCarNum;
	data['driverCarMobile'] = entity.driverCarMobile;
	data['driverHeadUrl'] = entity.driverHeadUrl;
	data['toName'] = entity.toName;
	data['toMobile'] = entity.toMobile;
	data['fromName'] = entity.fromName;
	data['fromMobile'] = entity.fromMobile;
	data['goodsValue'] = entity.goodsValue;
	data['isRefund'] = entity.isRefund;
	data['isPod'] = entity.isPod;
	data['goodsType'] = entity.goodsType;
	data['goodsTypeName'] = entity.goodsTypeName;
	data['isCompanyPay'] = entity.isCompanyPay;
	data['pack'] = entity.pack;
	data['insureStatus'] = entity.insureStatus;
	data['invoiceState'] = entity.invoiceState;
	data['totalCharge'] = entity.totalCharge;
	data['spUserName'] = entity.spUserName;
	return data;
}