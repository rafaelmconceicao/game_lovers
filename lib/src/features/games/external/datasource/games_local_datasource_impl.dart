import 'package:game_lovers/src/core/querys.dart';
import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';
import 'package:game_lovers/src/features/games/domain/entity/genre.model.dart';
import 'package:game_lovers/src/features/games/infra/datasource/games_local_datasource.dart';
import 'package:game_lovers/src/storage/database.dart';
import 'package:sqflite/sqflite.dart';

class GamesLocalDatasourceImpl implements GamesLocalDatasource {

  @override
  Future<List<Games>> getGamesLocal({
    required int idPlatform,
  }) async {
    try {
      List<Games> games = [];
      List<Games> gamesComplete = [];

      var db = await DatabaseHelper().openConnection();
      List<Map> data = await db.rawQuery(Querys.gamesByPlatform(idPlatform));

      for (var cl in data) {
        games.add(Games.fromJSON(cl));
      }

      // populando generos
      for (var gm in games) {
        gm.genres = <Genre>[];
        List<Map> data = await db.rawQuery(Querys.genreByGame(gm.id!));
        for (var cl in data) {
          gm.genres?.add(Genre.fromJSON(cl));
        }

        gamesComplete.add(gm);
      }

      return gamesComplete;
    } catch (e){
      return <Games>[];
    }
  }

  @override
  Future<void> updateGamesLocal(
      {required List<Games> games,
        required int idPlatform}) async {

    var db = await DatabaseHelper().openConnection();
    var batch = db.batch();

    for (var game in games) {
      batch.insert("games", game.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      game.genres?.forEach((genre) {
        genre.game = game.id;
        batch.insert("genres", genre.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      });
    }
    batch.commit();
  }

}
