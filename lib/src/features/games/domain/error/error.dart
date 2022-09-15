import 'package:game_lovers/src/core/exceptions.dart';

class ConnectionServiceGamesErrorFailure extends Failure {
  const ConnectionServiceGamesErrorFailure([
    int? code,
  ]) : super.defaultCode(
    title: 'Erro ao realizar o servico de games',
    message: 'Verificar o servico de games',
    code: code,
    defaultCode: 10600,
  );

}
