
import 'package:game_lovers/src/features/games/domain/entity/genre.model.dart';

abstract class GenreLocalRepository {
  Future<List<Genre>> getGenreLocal({
    required int idGame,
  });
}
