import 'package:cargo_flutter_app/model/question_detail_entity.dart';

questionDetailEntityFromJson(QuestionDetailEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['question'] != null) {
		data.question = json['question']?.toString();
	}
	if (json['answers'] != null) {
		data.answers = json['answers']?.toString();
	}
	return data;
}

Map<String, dynamic> questionDetailEntityToJson(QuestionDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['question'] = entity.question;
	data['answers'] = entity.answers;
	return data;
}