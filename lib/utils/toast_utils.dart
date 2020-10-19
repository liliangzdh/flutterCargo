import 'package:cargo_flutter_app/theme/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static show({String msg = '加载中'}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConfig.color_999,
        textColor: ColorConfig.colorfff,
        fontSize: 16.0);
  }
}
