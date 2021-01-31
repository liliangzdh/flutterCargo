import 'package:cargo_flutter_app/model/invoice_info_entity.dart';

invoiceInfoEntityFromJson(InvoiceInfoEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'];
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toInt();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['putUserId'] != null) {
		data.putUserId = json['putUserId'];
	}
	if (json['spUserId'] != null) {
		data.spUserId = json['spUserId']?.toInt();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['explain'] != null) {
		data.explain = json['explain']?.toString();
	}
	if (json['spUserName'] != null) {
		data.spUserName = json['spUserName']?.toString();
	}
	if (json['goodsIds'] != null) {
		data.goodsIds = json['goodsIds'];
	}
	if (json['invoiceNum'] != null) {
		data.invoiceNum = json['invoiceNum'];
	}
	if (json['mailTime'] != null) {
		data.mailTime = json['mailTime'];
	}
	if (json['mailCompany'] != null) {
		data.mailCompany = json['mailCompany'];
	}
	if (json['mailNum'] != null) {
		data.mailNum = json['mailNum'];
	}
	if (json['riesType'] != null) {
		data.riesType = json['riesType'];
	}
	if (json['taxNum'] != null) {
		data.taxNum = json['taxNum']?.toString();
	}
	if (json['bank'] != null) {
		data.bank = json['bank']?.toString();
	}
	if (json['bankAccount'] != null) {
		data.bankAccount = json['bankAccount']?.toString();
	}
	if (json['companyName'] != null) {
		data.companyName = json['companyName']?.toString();
	}
	if (json['companyAddress'] != null) {
		data.companyAddress = json['companyAddress']?.toString();
	}
	if (json['companyPhone'] != null) {
		data.companyPhone = json['companyPhone']?.toString();
	}
	if (json['collectName'] != null) {
		data.collectName = json['collectName']?.toString();
	}
	if (json['collectPhone'] != null) {
		data.collectPhone = json['collectPhone']?.toString();
	}
	if (json['collectAddress'] != null) {
		data.collectAddress = json['collectAddress']?.toString();
	}
	return data;
}

Map<String, dynamic> invoiceInfoEntityToJson(InvoiceInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['goodsId'] = entity.goodsId;
	data['state'] = entity.state;
	data['putUserId'] = entity.putUserId;
	data['spUserId'] = entity.spUserId;
	data['amount'] = entity.amount;
	data['createTime'] = entity.createTime;
	data['explain'] = entity.explain;
	data['spUserName'] = entity.spUserName;
	data['goodsIds'] = entity.goodsIds;
	data['invoiceNum'] = entity.invoiceNum;
	data['mailTime'] = entity.mailTime;
	data['mailCompany'] = entity.mailCompany;
	data['mailNum'] = entity.mailNum;
	data['riesType'] = entity.riesType;
	data['taxNum'] = entity.taxNum;
	data['bank'] = entity.bank;
	data['bankAccount'] = entity.bankAccount;
	data['companyName'] = entity.companyName;
	data['companyAddress'] = entity.companyAddress;
	data['companyPhone'] = entity.companyPhone;
	data['collectName'] = entity.collectName;
	data['collectPhone'] = entity.collectPhone;
	data['collectAddress'] = entity.collectAddress;
	return data;
}