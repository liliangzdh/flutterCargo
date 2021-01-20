import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final Color color;
  final Color splashColor;
  final Color highlightColor;
  final double elevation;
  final double highlightElevation;
  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry padding;

  MyRaisedButton({
    this.color = ColorConfig.colorfff,
    this.splashColor = ColorConfig.colorfff,
    this.highlightColor = ColorConfig.colorEf,
    this.elevation = 0,
    this.highlightElevation = 0,
    this.onPressed,
    this.child,
    this.padding = EdgeInsets.zero,
  });

  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: elevation,
      highlightElevation: highlightElevation,
      padding: padding,
      child: child,
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }
}
