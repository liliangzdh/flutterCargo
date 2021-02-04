import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

/// 列表 获取的参数
class DriverEntity with JsonConvert<DriverEntity> {
	int driverId;
	String name;
	String mobile;
	String headUrl;
	String length;
	String model;
	String num;
	List<dynamic> lineList;
	List<dynamic> addressesList;
	double mord;
	String distance;
	bool agree;
}
