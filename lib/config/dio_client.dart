import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3001',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  factory DioClient() => _instance;
  DioClient._internal();
  Dio get client => _dio;

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
