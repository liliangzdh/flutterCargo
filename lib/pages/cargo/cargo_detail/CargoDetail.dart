import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 货源详情
class CargoDetail extends StatefulWidget {
  CargoDetail({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CargoDetailState();
  }
}

class _CargoDetailState extends State<CargoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
        centerTitle: true,
        backgroundColor: ColorConfig.colorfff,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
