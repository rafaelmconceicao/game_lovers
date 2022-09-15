class Failure {
  final String title;
  final String message;
  final int code;

  const Failure({
    required this.title,
    required this.message,
    required this.code,
  }) : assert(code >= 10000);

  const Failure.defaultCode({
    required this.title,
    required this.message,
    required int? code,
    required int defaultCode,
  })  : assert(code == null || code >= 10000),
        assert(defaultCode >= 10000),
        assert(
        code == null || code > defaultCode && code < (defaultCode + 100)),
        code = code ?? defaultCode;

  List<Object> get props => [title, message];

  bool get stringify => true;
}

const kAppFailure = AppFailure();
const kServerFailure = ServerFailure();
const kCacheFailure = CacheFailure();
const kCredentialsFailure = CredentialsFailure();
const kConnectionFailure = ConnectionFailure();
const kNotAuthorizedFailure = NotAuthorizedFailure();
const kExpiredSessionFailure = ExpiredSessionFailure();

class ExpiredSessionFailure extends Failure {
  const ExpiredSessionFailure([int? code])
      : super.defaultCode(
    title: 'Sessão expirada',
    message: 'Sua sessão expirou, feche e abra novamente o aplicativo. '
        'A ação não foi concluída.',
    code: code,
    defaultCode: 10000,
  );
}

class AppFailure extends Failure {
  const AppFailure([int? code])
      : super.defaultCode(
    title: 'Algo deu errado',
    message:
    'Ocorreu um erro interno na aplicação, a ação não foi concluída.',
    code: code,
    defaultCode: 10100,
  );
}

class ServerFailure extends Failure {
  const ServerFailure([int? code])
      : super.defaultCode(
    title: 'Algo deu errado',
    message: 'Estamos com instabilidade, a ação não foi concluída.',
    code: code,
    defaultCode: 10200,
  );
}

class CacheFailure extends Failure {
  const CacheFailure([int? code])
      : super.defaultCode(
    title: 'Algo deu errado',
    message: 'Não foi possível carregar as informações.',
    code: code,
    defaultCode: 10300,
  );
}

class CredentialsFailure extends Failure {
  const CredentialsFailure([int? code])
      : super.defaultCode(
    title: 'Algo deu errado',
    message: 'Credenciais inválidas',
    code: code,
    defaultCode: 10400,
  );
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([int? code])
      : super.defaultCode(
    title: 'Falha na conexão',
    message: 'Encontramos uma falha na conexão,'
        '\nverifique sua internet e tente novamente.',
    code: code,
    defaultCode: 10500,
  );
}

class NotAuthorizedFailure extends Failure {
  const NotAuthorizedFailure([int? code])
      : super.defaultCode(
    title: 'Acesso não autorizado',
    message: 'Neste momento o app está restrito ao tipo de usuário.'
        '\nEntre\nem contato com o suporte',
    code: code,
    defaultCode: 10600,
  );
}

class AccessDatabaseFailure extends Failure {
  const AccessDatabaseFailure([int? code])
      : super.defaultCode(
    title: 'Problema com acesso ao banco de dados',
    message: 'Tente novamente mais tarde ou entre em contato com o suporte.',
    code: code,
    defaultCode: 10600,
  );
}

class EntityNotFoundFailure extends Failure {
  const EntityNotFoundFailure([int? code])
      : super.defaultCode(
    title: 'Problema ao consultar entidade.',
    message: 'Nenhum registro localizado para este parâmetro!',
    code: code,
    defaultCode: 10600,
  );
}

