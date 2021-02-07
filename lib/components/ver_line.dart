import 'package:flutter/material.dart';
import '../theme/Colors.dart';

class VerLine extends StatelessWidget {
  final double width;

  final Color color;

  final EdgeInsetsGeometry margin;

  VerLine(
      {Key key,
      this.width = 0.5,
      this.color = ColorConfig.colorE5,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      color: this.color,
      margin: this.margin,
    );
  }
}
