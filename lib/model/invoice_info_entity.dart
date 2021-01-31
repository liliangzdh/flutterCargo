import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

class InvoiceInfoEntity with JsonConvert<InvoiceInfoEntity> {
	dynamic id;
	int goodsId;
	int state;
	dynamic putUserId;
	int spUserId;
	double amount;
	String createTime;
	String explain;
	String spUserName;
	dynamic goodsIds;
	dynamic invoiceNum;
	dynamic mailTime;
	dynamic mailCompany;
	dynamic mailNum;
	dynamic riesType;
	String taxNum;
	String bank;
	String bankAccount;
	String companyName;
	String companyAddress;
	String companyPhone;
	String collectName;
	String collectPhone;
	String collectAddress;
}
