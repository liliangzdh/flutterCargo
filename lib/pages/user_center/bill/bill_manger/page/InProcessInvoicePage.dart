import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:flutter/widgets.dart';

/// 申请中 发票 页面
///
///

class InProcessInvoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InProcessInvoicePage();
  }
}

class _InProcessInvoicePage extends State<InProcessInvoicePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print("-------init State _InProcessInvoicePage");
  }

  @override
  void dispose() {
    super.dispose();
    print("-------dispose State _InProcessInvoicePage");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: ColorConfig.color_4DA0FF,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
