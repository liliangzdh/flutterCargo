import 'package:cargo_flutter_app/api/customer_api.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/question_detail_entity.dart';
import 'package:cargo_flutter_app/pages/user_center/question/question_detail_item.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 问题 详情
class QuestionDetail extends StatelessWidget {
  final int id;

  const QuestionDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('问题详情'),
        elevation: 0,
        backgroundColor: ColorConfig.colorfff,
      ),
      backgroundColor: ColorConfig.color_f4f4f4,
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 15),
        child: UnitedListView(
          itemBuilder: (List<QuestionDetailEntity> list, int position) {
            return QuestionDetailItem(list[position]);
          },
          pageRequest: (int pageNum, int pageSize) {
            return CustomerApi.questionList(
                page: pageNum, pageSize: pageSize, id: this.id);
          },
          fromJson: (dynamic m) {
            return QuestionDetailEntity().fromJson(m);
          },
        ),
      ),
    );
  }
}
