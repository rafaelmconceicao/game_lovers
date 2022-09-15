import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';
import 'package:game_lovers/src/features/games/domain/repository/games_local_repository.dart';
import 'package:game_lovers/src/features/games/infra/datasource/games_local_datasource.dart';

class GamesLocalRepositoryImpl implements GamesLocalRepository {
  const GamesLocalRepositoryImpl(this.datasource);

  final GamesLocalDatasource datasource;

  @override
  Future<List<Games>> getGamesLocal({
    required int idPlatform,
  }) {
    return datasource.getGamesLocal(
      idPlatform: idPlatform,
    );
  }

  @override
  Future<void> updateGamesLocal(
      {required List<Games> games, required int idPlatform}) {
    return datasource.updateGamesLocal(
      games: games,
      idPlatform: idPlatform,
    );
  }
}
