/*
 *
 *
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/main/index.dart';
import '../pages/login/Login.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Index();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Login();
    });
