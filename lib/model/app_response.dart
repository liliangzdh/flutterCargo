class AppResponse {
  // {"msg":"成功","code":0,"data":null,"count":0}
  int code;
  String msg;
  dynamic data;
  int count;

  AppResponse(this.code, this.msg, this.data);

  AppResponse.fromJson(Map<String, dynamic> json)
      : this.code = json['code'],
        this.msg = json['msg'],
        this.data = json['data'],
        this.count = json['count'];

  @override
  String toString() {
    return 'AppResponse(count=${this.count} code=${this.code},msg=${this.msg},data=${this.data})';
  }

  // 响应是否成功
  bool isOk() {
    return code == 0;
  }
}
