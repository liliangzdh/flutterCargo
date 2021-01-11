import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WayBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WayBill();
  }
}

class _WayBill extends State<WayBill> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('运单管理'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('发货'),
      ),
    );
  }
}
