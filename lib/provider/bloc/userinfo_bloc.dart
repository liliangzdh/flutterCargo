
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import '../../model/user_info_entity.dart';

class UserInfoBloc  {


  UserInfoEntity  userInfo = new UserInfoEntity();
  var _subject = BehaviorSubject<UserInfoEntity>();

  Stream<UserInfoEntity> get stream => _subject.stream;
  UserInfoEntity get value => userInfo;

  void setUerInfo(UserInfoEntity  userInfo){
    _subject.add(userInfo);
  }


  void clear(){
//    _subject.
    _subject.add(new UserInfoEntity());
  }

  void dispose() {
    _subject.close();
  }
}
