import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/widgets.dart';

/// 已经开具 发票 页面
///
///

class AlreadyInvoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AlreadyInvoicePage();
  }
}

class _AlreadyInvoicePage extends State<AlreadyInvoicePage>  with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    super.initState();
    print("-------init State _AlreadyInvoicePage");
  }

  @override
  void dispose() {
    super.dispose();
    print("-------dispose State _AlreadyInvoicePage");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: ColorConfig.color_E6E6E6,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
