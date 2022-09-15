import 'package:game_lovers/src/core/exceptions.dart';
import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';
import 'package:game_lovers/src/features/games/domain/error/error.dart';
import 'package:game_lovers/src/features/games/infra/datasource/games_remote_datasource.dart';
import 'package:game_lovers/src/utils/api_client/api_client.dart';
import 'package:game_lovers/src/utils/api_client/api_exception.dart';

class GamesRemoteDatasourceImpl implements GamesRemoteDatasource {
  final APIClient apiClient;

  GamesRemoteDatasourceImpl(this.apiClient);

  @override
  Future<List<Games>> getGames({required int idPlatform}) async {
    try {
      return await apiClient.post(
        '/games',
        data: '''
          fields 
          id, 
          name, 
          platforms, 
          summary, 
          screenshots.url, 
          genres.name, 
          genres.id,
          platforms.name;
          where platforms = $idPlatform;
          ''',
      ).then((response) {
        final body = response.data as List<dynamic>;
        var games = body.map((e) => Games.fromJson(e)).toList();
        return games;
      });
    } on APIException catch (_) {
      throw const ConnectionServiceGamesErrorFailure();
    } catch (_) {
      throw const ServerFailure();
    }
  }
}
