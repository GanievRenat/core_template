import 'package:dio/dio.dart';

abstract class ApiException {
  const ApiException();
}

class BaseApiException extends DioException implements ApiException {
  BaseApiException({
    required DioException dioError,
    required this.errorCode,
    this.details,
  }) : super(
         requestOptions: dioError.requestOptions,
         response: dioError.response,
         type: dioError.type,
         error: dioError.error,
       );

  /// Server-specific error code
  final String errorCode;

  /// Detailed debug info.
  final String? details;

  static Future<BaseApiException> parse(
    DioException dioError, {
    required Future<bool> Function() checkHasConnection,
  }) async {
    final statusCode = dioError.response?.statusCode;
    if (statusCode == 500) {
      return InternalError(dioError: dioError);
    }

    if (statusCode == 403) {
      return UserCreateException(dioError: dioError);
    }

    final hasConnection = await checkHasConnection();
    if (!hasConnection) {
      return NetworkConnectionException(dioError: dioError);
    }

    return BaseApiException(
      dioError: dioError,
      errorCode: 'unknown',
      details: 'Unknown error',
    );
  }
}

class InternalError extends BaseApiException {
  InternalError({
    required super.dioError,
    super.errorCode = '500',
    super.details,
  });
}

class NetworkConnectionException extends BaseApiException {
  NetworkConnectionException({
    required super.dioError,
    super.errorCode = 'NetworkConnectionException',
    super.details,
  });
}

class UserCreateException extends BaseApiException {
  UserCreateException({
    required super.dioError,
    super.errorCode = 'UserCreateException',
    super.details,
  });
}
