import 'package:cargo_flutter_app/api/customer_api.dart';
import 'package:cargo_flutter_app/components/raised_button.dart';
import 'package:cargo_flutter_app/components/united_list/united_list_view.dart';
import 'package:cargo_flutter_app/model/question_type_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 问题咨询

class QuestionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.color_f4f4f4,
      appBar: AppBar(
        backgroundColor: ColorConfig.colorfff,
        elevation: 0,
        title: Text('问题咨询'),
      ),
      body: Container(
        child: UnitedListView<QuestionTypeEntity>(
          itemBuilder: (List<QuestionTypeEntity> list, int position) {
            var item = list[position];
            return Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              height: 50,
              child: MyRaisedButton(
                onPressed: () {
                  RouteUtils.go(
                    context,
                    QuestionDetailKeyString,
                    params: {"id": item.id},
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Text('${item.content}'),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: ColorConfig.color99,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          pageRequest: (int pageNum, int pageSize) {
            return CustomerApi.typeList(page: pageNum, pageSize: pageSize);
          },
          fromJson: (dynamic m) {
            return QuestionTypeEntity().fromJson(m);
          },
        ),
      ),
    );
  }
}
