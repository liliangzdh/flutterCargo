class CommonListParams<T> {
  bool isLoading;

  String loadingText;
  List<T> listData;

  CommonListParams({this.isLoading, this.loadingText, this.listData});
}
