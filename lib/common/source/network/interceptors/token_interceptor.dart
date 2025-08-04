//import 'dart:developer';

import 'package:core_template/common/service/app_state_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class TokenInterceptor extends Interceptor {
  TokenInterceptor({required this.appStateService});

  final AppStateService appStateService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = appStateService.currentUser?.uid ?? '';
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
