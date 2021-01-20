import 'package:cargo_flutter_app/model/goods_resource_entity.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class LoginEvent {
  bool isLogin;

  LoginEvent(this.isLogin);
}

class ListViewAction {
  String key;
  String id;

  ListViewAction(this.key, this.id);
}

// 发货界面 刷新。
class SendGoodsListAction {
  String key;
  GoodsResourceEntity entity;

  int type;

  SendGoodsListAction({this.entity, this.key, this.type});

  @override
  String toString() {
    return 'SendGoodsListAction{key: $key, id: $entity, type: $type}';
  }
}
