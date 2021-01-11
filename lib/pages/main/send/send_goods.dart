import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SendGoods extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SendGoods();
  }
}

class _SendGoods extends State<SendGoods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发货'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('发货'),
      ),
    );
  }
}
