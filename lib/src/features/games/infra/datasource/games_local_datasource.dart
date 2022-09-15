import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';

abstract class GamesLocalDatasource {
  Future<List<Games>> getGamesLocal({
    required int idPlatform,
  });

  Future<void> updateGamesLocal({
    required List<Games> games,
    required int idPlatform,
  });
}
