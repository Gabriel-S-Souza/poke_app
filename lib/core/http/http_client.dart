import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared/domain/entities/failure/failure.dart';
import '../../shared/domain/entities/response/response.dart';

class HttpClient {
  final Dio _dio;

  HttpClient(this._dio) {
    _addInterceptor();
  }

  Future<ResponseApp> get(
    String url, {
    String? token,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: token != null
            ? Options(
                headers: {
                  HttpHeaders.authorizationHeader: 'Bearer $token',
                },
              )
            : null,
      );
      return ResponseApp(data: response.data, statusCode: response.statusCode);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<ResponseApp> post(
    String path, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
        options: token != null
            ? Options(
                headers: {
                  HttpHeaders.authorizationHeader: 'Bearer $token',
                },
              )
            : null,
      );
      return ResponseApp(data: response.data, statusCode: response.statusCode);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<ResponseApp> put(
    String path, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: body,
        options: token != null
            ? Options(
                headers: {
                  HttpHeaders.authorizationHeader: 'Bearer $token',
                },
              )
            : null,
      );
      return ResponseApp(data: response.data, statusCode: response.statusCode);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<ResponseApp> delete(
    String path, {
    String? token,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        options: token != null
            ? Options(
                headers: {
                  HttpHeaders.authorizationHeader: 'Bearer $token',
                },
              )
            : null,
      );
      return ResponseApp(data: response.data, statusCode: response.statusCode);
    } catch (e) {
      throw _handleError(e);
    }
  }

  void _addInterceptor() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) => debugPrint(object.toString()),
    ));
  }

  Failure _handleError(Object e) {
    if (e is! DioError) return UnmappedFailure(e.toString());

    if (e.response != null && e.response!.statusCode != null) {
      final error = _handleErrorByStatusCode(e.response!.statusCode!);
      if (error != null) {
        return error;
      }
    }

    final error = _handleErrorByType(e);

    if (error != null) {
      return error;
    }

    return UnmappedFailure(e.toString());
  }

  Failure? _handleErrorByStatusCode(Object e) {
    if (e is! DioError) return UnmappedFailure(e.toString());
    switch (e.response!.statusCode) {
      case 400:
        return BadRequestFailure(e.response!.data.toString());
      case 401:
        return UnauthorizedFailure();
      case 404:
        return NotFoundFailure();
      case 500:
        return ServerFailure(e.response!.data.toString());
      default:
        return null;
    }
  }

  Failure? _handleErrorByType(DioError e) {
    switch (e.type) {
      case DioErrorType.unknown:
        return UnmappedFailure(e.message != null ? e.message.toString() : e.error.toString());
      case DioErrorType.connectionTimeout:
        return OfflineFailure();
      case DioErrorType.cancel:
      case DioErrorType.receiveTimeout:
      case DioErrorType.badResponse:
        return ServerFailure(e.message.toString());
      default:
        return null;
    }
  }
}
