import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/app_config.dart';
import '../interceptors/interceptors.dart';
import '../network_manager.dart';

class DependencyDioName {
  static const dioWithAuth = 'dioWithAuth';
  static const dioWithoutAuth = 'dioWithNoAuth';
}

@module
abstract class HttpClientModule {
  @Named(DependencyDioName.dioWithoutAuth)
  Dio dioWithoutAuth(
    AppConfig config,
    LoggerInterceptor loggerInterceptor,
    ErrorInterceptor errorInterceptor,
    LanguageInterceptor languageInterceptor,
  ) => NetworkManager.getHttpClient(
    config: config,
    interceptors: [languageInterceptor, loggerInterceptor, errorInterceptor],
  );

  @Named(DependencyDioName.dioWithAuth)
  Dio dioWithAuth(
    AppConfig config,
    LoggerInterceptor loggerInterceptor,
    ErrorInterceptor errorInterceptor,
    TokenInterceptor tokenInterceptor,
    LanguageInterceptor languageInterceptor,
  ) => NetworkManager.getHttpClient(
    config: config,
    interceptors: [
      languageInterceptor,
      tokenInterceptor,
      loggerInterceptor,
      errorInterceptor,
    ],
  );
}
