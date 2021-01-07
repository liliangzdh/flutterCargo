import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

class UserInfoEntity with JsonConvert<UserInfoEntity> {
	int id;
	String mobile;
	String headUrl;

	String name;
	int state;
	int userType;
	String caSign;
	String createTime;
	String loginTime;
	int loginNum;
	String reCode;
	String baseId;
	String idImgFront;
	String idImgReverse;
	String idImgHolding;
	String startCardValidity;
	String endCardValidity;
	double num;
	int isFreeze;
	double cost;
	String rid;
}
