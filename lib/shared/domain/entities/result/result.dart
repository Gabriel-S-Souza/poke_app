import '../failure/failure.dart';

class Result<T> {
  final T? _data;
  final Failure? _failure;

  const Result._(this._data, this._failure);

  factory Result.success(T data) => Result._(data, null);

  factory Result.failure(Failure failure) => Result._(null, failure);

  bool get isSuccess => _data != null;

  T get data => _data!;

  Failure get error => _failure!;

  void when({
    required void Function(T) onSuccess,
    void Function(Failure)? onFailure,
  }) {
    if (_data != null) {
      onSuccess(data);
    } else {
      onFailure?.call(error);
    }
  }
}
