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
