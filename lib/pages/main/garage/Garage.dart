import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Garage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Garage();
  }
}

class _Garage extends State<Garage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('车辆管理'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('车辆'),
      ),
    );
  }
}
