import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

class BillEntity with JsonConvert<BillEntity> {
	int id;
	String userId;
	int type;
	String brId;
	int isCom;
	String thirdOrders;
	int payMethod;
	String orderFlow;
	double amount;
	double totalFee;
	double resultBalance;
	String createTime;
	String updateTime;
	int isSuccess;
	int isDeleted;
	String explain;
	String createdBy;
	int userType;
	String userMobile;
	String userName;
}
