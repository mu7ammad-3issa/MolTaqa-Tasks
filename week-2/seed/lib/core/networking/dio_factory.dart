import 'package:dio/dio.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;
  static Dio getDio() {
    Duration timeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {'Accept': 'application/json'};
  }
}
