import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';
import 'package:game_lovers/src/features/games/domain/repository/games_local_repository.dart';
import 'package:game_lovers/src/features/games/domain/repository/games_remote_repository.dart';

class GamesLocalUsecase {
  const GamesLocalUsecase({
    required this.repositoryLocal,
    required this.repositoryRemote,
  });

  final GamesLocalRepository repositoryLocal;
  final GamesRemoteRepository repositoryRemote;

  Future<List<Games>> getGamesLocal({
    required int idPlatform,
  }) async {
    await updateGamesLocal(idPlatform: idPlatform);
    return repositoryLocal.getGamesLocal(idPlatform: idPlatform);
  }

  Future<void> updateGamesLocal({
    required int idPlatform,
  }) async {
    await repositoryRemote.getGames(idPlatform: idPlatform).then((value) {
      repositoryLocal
          .updateGamesLocal(games: value, idPlatform: idPlatform)
          .then((value) {
        return value;
      });
    });
  }
}
