import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';

abstract class GamesRemoteRepository {
  Future<List<Games>> getGames({
    required int idPlatform,
  });
}
