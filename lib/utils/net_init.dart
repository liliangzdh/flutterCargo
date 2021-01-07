import 'package:cargo_flutter_app/api/userInfo_api.dart';
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/model/user_info_entity.dart';
import 'package:cargo_flutter_app/provider/single_global_instance/appstate_bloc.dart';
import 'package:cargo_flutter_app/utils/share_perference_utils.dart';

class NetInit {
  /// 初始化 是否 登录。并获取 用户信息。
  initAppState() async {

    String token = await SharePreferenceUtils.getToken();
    if(token!= null && token.length >0){
      AppResponse res = await UserInfoApi.getSpUser();
      if(res.isOk()){
        var userInfo = UserInfoEntity().fromJson(res.data);
        appStateBloc.setUerInfo(userInfo);
        await SharePreferenceUtils.saveUserInfo(res.data);
      }

    }

  }
}

NetInit netInit = new NetInit();
