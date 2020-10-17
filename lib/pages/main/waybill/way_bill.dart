import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WayBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WayBill();
  }
}

class _WayBill extends State<WayBill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text('运单'),
    ));
  }
}
