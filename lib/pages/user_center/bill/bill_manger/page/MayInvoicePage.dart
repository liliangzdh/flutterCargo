import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/widgets.dart';

/// 可开具 发票 页面
///
///

class MayInvoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MayInvoicePage();
  }
}

class _MayInvoicePage extends State<MayInvoicePage> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
    print("-------init State _MayInvoicePage");
  }

  @override
  void dispose() {
    super.dispose();
    print("-------dispose State _MayInvoicePage");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: ColorConfig.color_999,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
