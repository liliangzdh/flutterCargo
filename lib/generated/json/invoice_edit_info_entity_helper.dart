import 'package:cargo_flutter_app/model/invoice_edit_info_entity.dart';

invoiceEditInfoEntityFromJson(InvoiceEditInfoEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['spUserId'] != null) {
		data.spUserId = json['spUserId']?.toInt();
	}
	if (json['riesType'] != null) {
		data.riesType = json['riesType']?.toInt();
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
	if (json['remarks'] != null) {
		data.remarks = json['remarks']?.toString();
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
	if (json['spUserName'] != null) {
		data.spUserName = json['spUserName']?.toString();
	}
	return data;
}

Map<String, dynamic> invoiceEditInfoEntityToJson(InvoiceEditInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['spUserId'] = entity.spUserId;
	data['riesType'] = entity.riesType;
	data['taxNum'] = entity.taxNum;
	data['bank'] = entity.bank;
	data['bankAccount'] = entity.bankAccount;
	data['companyName'] = entity.companyName;
	data['companyAddress'] = entity.companyAddress;
	data['companyPhone'] = entity.companyPhone;
	data['remarks'] = entity.remarks;
	data['collectName'] = entity.collectName;
	data['collectPhone'] = entity.collectPhone;
	data['collectAddress'] = entity.collectAddress;
	data['spUserName'] = entity.spUserName;
	return data;
}