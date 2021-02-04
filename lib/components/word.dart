import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/widgets.dart';

class Word extends StatelessWidget {
  final String text;

  final Color color;

  Word(this.text, {this.color = ColorConfig.color_FF5151});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${text}',
        style: TextStyle(color: ColorConfig.colorfff),
      ),
      padding: EdgeInsets.only(
        left: 4,
        right: 4,
        top: 2,
        bottom: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: color,
      ),
    );
  }
}
