import 'package:game_lovers/src/core/querys.dart';
import 'package:game_lovers/src/features/games/domain/entity/genre.model.dart';
import 'package:game_lovers/src/features/games/infra/datasource/genres_local_datasource.dart';
import 'package:game_lovers/src/storage/database.dart';

class GenreLocalDatasourceImpl implements GenreLocalDatasource {
  @override
  Future<List<Genre>> getGenreLocal({
    required int idGame,
  }) async {
    try {
      List<Genre> genres = [];

      var db = await DatabaseHelper().openConnection();
      List<Map> data = await db.rawQuery(Querys.genreByGame(idGame));

      for (var cl in data) {
        genres.add(Genre.fromJSON(cl));
      }

      return genres;
    } catch (e) {
      return <Genre>[];
    }
  }
}
