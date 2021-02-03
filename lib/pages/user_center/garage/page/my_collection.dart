import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/widgets.dart';

/// 我的收藏。
class MyCollection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCollection();
  }
}

class _MyCollection extends State<MyCollection> {


  @override
  void initState() {
    super.initState();
    print("----init collection");
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: ColorConfig.colorfff);
  }


}
