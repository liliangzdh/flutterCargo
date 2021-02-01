import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/widgets.dart';

class CircleSelectBtn extends StatelessWidget {

  final bool isSelect ;


  CircleSelectBtn(this.isSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConfig.color_EEEEEE,
            ),
          ),
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelect
                    ? ColorConfig.color_4DA0FF
                    : ColorConfig.color_EEEEEE),
          )
        ],
      ),
    );
  }
}
