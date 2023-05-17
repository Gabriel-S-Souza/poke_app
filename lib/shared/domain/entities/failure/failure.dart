class Failure implements Exception {
  final String message;

  const Failure(this.message);

  @override
  String toString() => 'Failure: $message';
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Erro na comunicação com o servidor']);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure([super.message = 'Requisição inválida']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Não encontrado']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Não autorizado']);
}

class OfflineFailure extends Failure {
  const OfflineFailure([super.message = 'Sem conexão com a internet']);
}

class UnmappedFailure extends Failure {
  const UnmappedFailure([super.message = 'Ops, algo deu errado']);

  @override
  String toString() => 'Ops, algo deu errado: $message. [UnmappedFailure]';
}
