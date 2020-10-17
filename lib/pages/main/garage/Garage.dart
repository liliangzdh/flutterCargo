import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Garage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Garage();
  }
}

class _Garage extends State<Garage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text('车库'),));
  }
}
