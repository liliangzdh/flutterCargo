import 'package:cargo_flutter_app/components/line.dart';
import 'package:cargo_flutter_app/model/question_detail_entity.dart';
import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionDetailItem extends StatefulWidget {
  final QuestionDetailEntity item;

  QuestionDetailItem(this.item);

  @override
  State<StatefulWidget> createState() {
    return _QuestionDetailItem();
  }
}

class _QuestionDetailItem extends State<QuestionDetailItem> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: ColorConfig.colorfff,
        child: Column(
          children: [
            Container(
              height: 40,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.item.question}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      isOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ),
                ],
              ),
            ),
            Line(
              color: ColorConfig.color_f4f4f4,
              height: 1,
            ),
            isOpen
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: Text('${widget.item.answers}'),
                  )
                : Container(),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
    );
  }
}
