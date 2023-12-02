import 'package:get/get.dart';

abstract class BaseService extends GetConnect {
  static String BASE_API_URL = "http://habitof.soheilrahsaz.ir/api/v1";

  String get baseServicePath;

  Future<Response<T>> doPost<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super.post(BASE_API_URL + baseServicePath + url, body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);
  }
}
