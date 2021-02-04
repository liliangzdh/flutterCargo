import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 发布货源
class SendCargo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SendCargo();
  }
}

class _SendCargo extends State<SendCargo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.colorfff,
        elevation: 0,
        title: Text('发货货源'),
      ),
    );
  }
}
