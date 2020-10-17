class AppResponse {
  // {"msg":"成功","code":0,"data":null,"count":0}
  int code;
  String msg;
  dynamic data;

  AppResponse(this.code, this.msg, this.data);

  AppResponse.fromJson(Map<String, dynamic> json)
      : this.code = json['code'],
        this.data = json['data'],
        this.msg = json['msg'];

  @override
  String toString() {
    return 'AppResponse(code=${this.code},msg=${this.msg},data=${this.data})';
  }

  // 响应是否成功
  bool isOk() {
    return code == 0;
  }
}
