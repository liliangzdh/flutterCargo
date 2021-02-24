import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

class GoodsTypeEntity with JsonConvert<GoodsTypeEntity> {
	int id;
	int parentId;
	String name;
	String code;
	int isHot;
	String pack;
	String createTime;
	String updateTime;
	int isDeleted;
	int isSys;
	String parentName;
}
