/*
 *
 *
 * mvvm 的 ViewModel 基类
 *
 */

import 'dart:async';

import 'package:cargo_flutter_app/mvvm/state/LoadingState.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel<T> {
  // 初始化加载 成功。
  LoadingState loadingState;

  // 目标 类。
  T dataSource;

  var loadingStateController = StreamController<LoadingState>.broadcast();

  Sink get loadingStateSink => loadingStateController;

  Stream get outputLoadingStateStream => loadingStateController.stream;

  BaseViewModel() {
    loadingState = initLoadingState();
    dataSource = initModal();
  }

  setLoading({text: '加载中...'}) {
    loadingState.text = text;
    loadingState.isLoading = true;

    loadingStateSink.add(loadingState);
  }

  hideLoading() {
    loadingState.isLoading = false;
    loadingStateSink.add(loadingState);
  }

  LoadingState initLoadingState() {
    return LoadingState(false, "加载中...");
  }

  var _dataSourceController = StreamController<T>.broadcast();

  Sink get inputDataSink => _dataSourceController;

  Stream get outputDataStream => _dataSourceController.stream;

  updateDataSource(T t){
    dataSource = t;
    inputDataSink.add(dataSource);
  }

  dispose() {
    _dataSourceController.close();
    loadingStateController.close();
  }

  // 键盘弹出 消失
  keyboardDismiss(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  T initModal();
}
