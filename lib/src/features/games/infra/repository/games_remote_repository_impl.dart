import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';
import 'package:game_lovers/src/features/games/domain/repository/games_remote_repository.dart';
import 'package:game_lovers/src/features/games/infra/datasource/games_remote_datasource.dart';

class GamesRemoteRepositoryImpl implements GamesRemoteRepository {
  final GamesRemoteDatasource datasource;

  GamesRemoteRepositoryImpl(this.datasource);

  @override
  Future<List<Games>> getGames({
    required int idPlatform,
  }) {
    return datasource.getGames(idPlatform: idPlatform);
  }
}
