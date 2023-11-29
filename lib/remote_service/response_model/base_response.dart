class BaseResponse<T> {
  BaseResponse({this.result, this.error});

  T? result;
  String? error;
}
