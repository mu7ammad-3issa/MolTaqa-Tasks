import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl;

  ApiService({required this.dio, required this.baseUrl});

  Future<Map<String, dynamic>> post({
    required String endpoint,
    dynamic body,
  }) async {
    var response = await dio.post('$baseUrl$endpoint', data: body);
    return response.data;
  }
}
