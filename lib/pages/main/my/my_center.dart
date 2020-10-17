import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCenter();
  }
}

class _MyCenter extends State<MyCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text('我的'),));
  }
}
