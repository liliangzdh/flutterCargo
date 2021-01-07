import 'dart:ui';

import 'package:flutter/widgets.dart';

class MyClipper extends CustomClipper<Rect> {

  double width;

  MyClipper(this.width);

  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(
        width, width, size.width - width, size.height - width);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
