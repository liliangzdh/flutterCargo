import 'package:cargo_flutter_app/model/question_type_entity.dart';

questionTypeEntityFromJson(QuestionTypeEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	return data;
}

Map<String, dynamic> questionTypeEntityToJson(QuestionTypeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['content'] = entity.content;
	return data;
}