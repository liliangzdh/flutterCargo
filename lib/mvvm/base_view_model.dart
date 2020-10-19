/*
 *
 *
 * mvvm 的 ViewModel 基类
 *
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class BaseViewModel<T> {
  // 初始化加载 成功。
  bool loadingState;

  var loadingStateController = StreamController<bool>.broadcast();

  Sink get loadingStateSink => loadingStateController;

  Stream get outputLoadingStateStream => loadingStateController.stream;

  BaseViewModel() {
    loadingState = iniLoadingState();
  }

  setLoading(bool state) {
    loadingState = state;
    loadingStateSink.add(loadingState);
  }

  bool iniLoadingState() {
    return true;
  }

  var _dataSourceController = StreamController<T>.broadcast();

  Sink get inputData => _dataSourceController;

  Stream get outputData => _dataSourceController.stream;

  dispose() {
    _dataSourceController.close();
    loadingStateController.close();
  }

  // 键盘弹出 消失
  keyboardDismiss(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
