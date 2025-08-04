//import 'dart:io';
import 'package:dio/dio.dart';

import '../../domain/app_config.dart';

class NetworkManager {
  NetworkManager._();

  static Dio getHttpClient({
    required AppConfig config,
    List<Interceptor> interceptors = const [],
  }) => _getDioClient(
    baseUrl: Uri.parse(config.baseUrl),
    interceptors: interceptors,
  );

  static Dio _getDioClient({
    required Uri baseUrl,
    Duration connectTimeout = const Duration(seconds: 25),
    Duration receiveTimeout = const Duration(seconds: 25),
    Duration sendTimeout = const Duration(seconds: 25),
    List<Interceptor> interceptors = const [],
    String? contentType,
  }) {
    final options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      contentType: contentType,
      headers: {'Content-Type': 'application/json'},
    )..baseUrl = baseUrl.toString();

    final dio = Dio(options);

    dio.interceptors.addAll(interceptors);

    return dio;
  }
}
