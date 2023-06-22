import 'package:dio/dio.dart';

import '../utils/api_paths.dart';

final dioApp = Dio(
  BaseOptions(
    baseUrl: ApiPaths.baseUrl + ApiPaths.basePath,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ),
);
