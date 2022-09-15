import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';
import 'package:game_lovers/src/features/games/domain/repository/games_remote_repository.dart';

class GamesRemoteUsecase {
  const GamesRemoteUsecase({
    required this.repository,
  });

  final GamesRemoteRepository repository;

  Future<List<Games>> getGames({
    required int idPlatform,
  }) async {
    return await repository.getGames(idPlatform: idPlatform);
  }
}
