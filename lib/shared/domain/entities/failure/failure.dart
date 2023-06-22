class Failure<T> implements Exception {
  final String message;
  final T? cachedData;

  const Failure(this.message, {this.cachedData});

  Failure<type> copyWith<type extends Object>({String? message, type? cachedData}) => Failure<type>(
        message ?? this.message,
        cachedData: cachedData,
      );
}

class ServerFailure<T> extends Failure<T> {
  const ServerFailure({String? message, super.cachedData})
      : super(message ?? 'Erro interno no servidor');

  @override
  String toString() => 'ServerFailure($message)';
}

class BadRequestFailure<T> extends Failure<T> {
  const BadRequestFailure({String? message, super.cachedData})
      : super(message ?? 'Requisição inválida');

  @override
  String toString() => 'BadRequestFailure($message)';
}

class NotFoundFailure<T> extends Failure<T> {
  const NotFoundFailure({String? message, super.cachedData}) : super(message ?? 'Não encontrado');

  @override
  String toString() => 'NotFoundFailure($message)';
}

class UnauthorizedFailure<T> extends Failure<T> {
  const UnauthorizedFailure({String? message, super.cachedData})
      : super(message ?? 'Não autorizado');

  @override
  String toString() => 'UnauthorizedFailure($message)';
}

class OfflineFailure<T> extends Failure<T> {
  const OfflineFailure({String? message, super.cachedData})
      : super(message ?? 'Sem conexão com a internet');

  @override
  String toString() => 'OfflineFailure($message)';
}

class UnmappedFailure<T> extends Failure<T> {
  const UnmappedFailure({String? message, super.cachedData})
      : super(message ?? 'Ops, algo deu errado');

  @override
  String toString() => 'UnmappedFailure($message)';
}
