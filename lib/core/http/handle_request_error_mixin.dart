import 'dart:io';

import 'package:dio/dio.dart';

import '../../shared/domain/entities/failure/failure.dart';

mixin HandleRequestErrorMixin {
  Failure handleError(Object e) {
    if (e is! DioError) return UnmappedFailure(e.toString());

    if (e.response != null && e.response!.statusCode != null) {
      final error = _handleErrorByStatusCode(e.response!.statusCode);
      if (error != null) {
        return error;
      }
    }

    return _handleErrorByType(e);
  }

  Failure? _handleErrorByStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return const BadRequestFailure();
      case 401:
        return const UnauthorizedFailure();
      case 404:
        return const NotFoundFailure();
      case 500:
        return const ServerFailure();
      default:
        return null;
    }
  }

  Failure _handleErrorByType(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return const OfflineFailure();
      case DioErrorType.cancel:
      case DioErrorType.receiveTimeout:
      case DioErrorType.badResponse:
        return ServerFailure(e.message);
      case DioErrorType.unknown:
        if (e.error is SocketException &&
            e.error.toString().toLowerCase().contains('network is unreachable')) {
          return const OfflineFailure();
        }
        return UnmappedFailure(e.message);
      default:
        return UnmappedFailure(e.message);
    }
  }
}
