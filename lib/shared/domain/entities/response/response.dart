class ResponseApp<T> {
  final T data;
  final int? statusCode;
  final String? statusMessage;

  ResponseApp({
    required this.data,
    this.statusCode,
    this.statusMessage,
  });

  bool get isOk => statusCode != null && statusCode! >= 200 && statusCode! < 300;
}
