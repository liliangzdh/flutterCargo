import 'package:cargo_flutter_app/generated/json/base/json_convert_content.dart';

class QuestionDetailEntity with JsonConvert<QuestionDetailEntity> {
	int id;
	String question;
	String answers;
}
