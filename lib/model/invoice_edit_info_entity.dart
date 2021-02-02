import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

class InvoiceEditInfoEntity with JsonConvert<InvoiceEditInfoEntity> {
	String id;
	int spUserId;
	int riesType;
	String taxNum;
	String bank;
	String bankAccount;
	String companyName;
	String companyAddress;
	String companyPhone;
	String remarks;
	String collectName;
	String collectPhone;
	String collectAddress;
	String spUserName;
}
