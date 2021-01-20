/// 网络请求接口 单列 模式。
import 'package:cargo_flutter_app/model/app_response.dart';
import 'package:cargo_flutter_app/provider/single_global_instance/appstate_bloc.dart';
import 'package:cargo_flutter_app/utils/router_util.dart';
import 'package:cargo_flutter_app/utils/share_perference_utils.dart';
import 'package:dio/adapter.dart';
import "package:dio/dio.dart";
import '../../config/config.dart';
import 'dart:convert' as JSON;

class ApiManger {
  factory ApiManger() => _getInstance();

  static ApiManger get instance => _getInstance();
  static ApiManger _instance;

  static Dio dio;

  ApiManger._internal() {
    // 初始化
    dio = Dio();
    BaseOptions baseOptions = BaseOptions(
      baseUrl: UrlConfig.ApiBaseUlr,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );

    // 设置能被花瓶 抓包。
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // ignore: non_constant_identifier_names
      client.findProxy = (Uri) {
        // 用1个开关设置是否开启代理
        return UrlConfig.isDebug ? 'PROXY 192.168.0.20:8888' : 'DIRECT';
      };
    };
    dio.options = baseOptions;


    // 打印请求,响应日志
    // dio.interceptors.add(LogInterceptor(responseBody: true));

    // 拦截器。
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options) async {
          // 在请求被发送之前做一些事情
          return options; //continue
          // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
          // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
          //
          // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
          // 这样请求将被中止并触发异常，上层catchError会被调用。
        },
        onResponse:(Response response) async {
          // 在返回响应数据之前做一些预处理
          AppResponse appResponse;
          if (response.statusCode == 200) {
            if (response.data is String) {
              appResponse =
              new AppResponse.fromJson(JSON.jsonDecode(response.data));
            } else {
              appResponse = new AppResponse.fromJson(response.data);
            }
          } else {
            appResponse = new AppResponse(response.statusCode, '获取数据异常', null);
          }
          if(appResponse.code == 702 || appResponse.code == 701){
            // 登录token 失效。
            await SharePreferenceUtils.saveToken("");
            print("------------->401了 清除登录的token");
            appStateBloc.setUerInfo(null);

            // 跳转登录。
            RouteUtils.goLogin(null);
          }

          return response; // continue
        },
        onError: (DioError e) async {
          // 当请求失败时做一些预处理
          return e;//continue
        }
    ));
  }

  static ApiManger _getInstance() {
    if (_instance == null) {
      _instance = new ApiManger._internal();
    }
    return _instance;
  }

  // 发送请求
  Future<AppResponse> sendRequest(
      String url, String method, Map<String, dynamic> params) async {
    Response response;
    bool isFormData = params['form'];

    var token = await SharePreferenceUtils.getToken();
    if (token != null && token.length > 0) {
      dio.options.headers.addAll({"token": token});
    }



    try {
      if (method.toLowerCase() == 'post') {
        if (isFormData != null && isFormData == false) {
          // post 表单。
          response = await dio.post(url, data: new FormData.fromMap(params));
        } else {
          // post json。
          response = await dio.post(url, data: params);
        }
      } else {
        // get 表单。
        response = await dio.get(url, queryParameters: params);
      }
      AppResponse appResponse;
      if (response.statusCode == 200) {
        if (response.data is String) {
          appResponse =
              new AppResponse.fromJson(JSON.jsonDecode(response.data));
        } else {
          appResponse = new AppResponse.fromJson(response.data);
        }
        // print(JSON.jsonEncode(appResponse.data));
      } else {
        appResponse = new AppResponse(response.statusCode, '获取数据异常', null);
      }
      return Future.value(appResponse);
    } on DioError catch (err) {
      print("1212---------dio");
      print(err.toString());
      AppResponse appResponse =
          new AppResponse(900, "连接不上网络:" + err.message, null);
      if (err.response != null) {
        var resData = err.response.data;
        print("------------->虽然异常了，但是还是有返回的:" + resData.toString());
      }
      if (err.type == DioErrorType.CONNECT_TIMEOUT) {
        appResponse = new AppResponse(500, "连接超时", null);
      }
      return Future.value(appResponse);
    } catch (exception) {
      print("---------dio othter error");
      print(exception.toString());
      return Future.value(new AppResponse(1000, "其他错误", null));
    }
  }
}
