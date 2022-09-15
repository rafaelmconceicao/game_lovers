import 'package:game_lovers/src/features/games/domain/entity/genre.model.dart';
import 'package:game_lovers/src/features/games/domain/repository/genres_local_repository.dart';
import 'package:game_lovers/src/features/games/infra/datasource/genres_local_datasource.dart';

class GenreLocalRepositoryImpl implements GenreLocalRepository {
  const GenreLocalRepositoryImpl(this.datasource);

  final GenreLocalDatasource datasource;

  @override
  Future<List<Genre>> getGenreLocal({
    required int idGame,
  }) {
    return datasource.getGenreLocal(idGame: idGame);
  }
}
