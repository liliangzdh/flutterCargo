import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final Color color;
  final Color highlightColor;
  final double elevation;
  final double highlightElevation;
  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;

  MyRaisedButton({
    this.color = ColorConfig.colorfff,
    this.highlightColor = ColorConfig.colorEf,
    this.elevation = 0,
    this.highlightElevation = 0,
    this.onPressed,
    this.child,
    this.padding = EdgeInsets.zero,
    this.shape,
  });

  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      splashColor: highlightColor,
      highlightColor: highlightColor,
      elevation: elevation,
      highlightElevation: highlightElevation,
      padding: padding,
      child: child,
      shape: shape,
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }
}
