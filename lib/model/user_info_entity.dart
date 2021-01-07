import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

class UserInfoEntity with JsonConvert<UserInfoEntity> {
	dynamic bankAccount;
	String businessLicenseUrl;
	String companyName;
	int endCardMaturityState;
	String headUrl;
	String mobile;
	UserInfoOrderVo orderVo;
	UserInfoSpUserAuth spUserAuth;
	dynamic endCardMaturityDay;
	dynamic businessLicenseDay;
	dynamic businessLicenseState;
	double balance;
	String createTime;
	dynamic goodsBaseList;
	String caSign;
	String companyAddress;
	String name;
	int id;
	int state;
	int userType;
}

class UserInfoOrderVo with JsonConvert<UserInfoOrderVo> {
	double amountNum;
	int orderNum;
	int sendNum;
}

class UserInfoSpUserAuth with JsonConvert<UserInfoSpUserAuth> {
	dynamic startBusinessLicense;
	double yHCurrencyBalance;
	dynamic cost;
	String businessLicenseUrl;
	String companyName;
	String conName;
	String idImgFront;
	int userId;
	String conMobile;
	double balance;
	String legalPersonIdentity;
	dynamic createTime;
	String caSign;
	String orgCode;
	String companyAddress;
	String legalPerson;
	dynamic id;
	String endBusinessLicense;
	String idImgReverse;
}
