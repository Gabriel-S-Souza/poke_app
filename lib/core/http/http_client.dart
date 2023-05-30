import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared/domain/entities/response/response.dart';
import 'handle_req_error_mixin.dart';

class HttpClient with HandleReqErrorMixin {
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
      throw handleError(e);
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
      throw handleError(e);
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
      throw handleError(e);
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
      throw handleError(e);
    }
  }

  void _addInterceptor() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) => debugPrint(object.toString()),
    ));
  }
}
