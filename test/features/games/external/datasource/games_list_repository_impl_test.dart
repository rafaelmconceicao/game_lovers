import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';
import 'package:game_lovers/src/utils/api_client/api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'games_list_repository_impl_test.mocks.dart';

@GenerateMocks([APIClient])
void main() {
  late APIClient apiClient;

  setUp(() {
    apiClient = MockAPIClient();
  });

  test('Should return game list', () async {
    late Response response;

    when(apiClient.post(
      '/games',
    )).thenAnswer((_) async {
      response = Response(
          data: jsonDecode(jsonData), requestOptions: RequestOptions(path: ''));

      expect(response.data, isA<List<Games>>());

      return response;
    });
  });


}

String jsonData = '''   
  fields
  id,
  name,
  platforms,
  summary,
  screenshots.url,
  genres.name,
  genres.id,
  platforms.name;
  where platforms = 49;
''';
