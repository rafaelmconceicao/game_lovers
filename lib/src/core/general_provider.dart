import 'package:flutter/material.dart';
import 'package:game_lovers/src/core/logger.dart';
import 'package:game_lovers/src/features/games/domain/repository/games_local_repository.dart';
import 'package:game_lovers/src/features/games/domain/repository/games_remote_repository.dart';
import 'package:game_lovers/src/features/games/domain/usecase/games_local_usecase.dart';
import 'package:game_lovers/src/features/games/domain/usecase/games_remote_usecase.dart';
import 'package:game_lovers/src/features/games/external/datasource/games_local_datasource_impl.dart';
import 'package:game_lovers/src/features/games/external/datasource/games_remote_datasource_impl.dart';
import 'package:game_lovers/src/features/games/infra/datasource/games_local_datasource.dart';
import 'package:game_lovers/src/features/games/infra/datasource/games_remote_datasource.dart';
import 'package:game_lovers/src/features/games/infra/repository/games_local_repository_impl.dart';
import 'package:game_lovers/src/features/games/infra/repository/games_remote_repository_impl.dart';
import 'package:game_lovers/src/utils/api_client/api_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class GeneralProvider extends StatefulWidget {
  const GeneralProvider({
    required this.builder,
    required this.errorLogger,
    Key? key,
  }) : super(key: key);

  final WidgetBuilder builder;
  final ErrorLogger errorLogger;

  @override
  _GeneralProviderState createState() => _GeneralProviderState();
}

class _GeneralProviderState extends State<GeneralProvider> {
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      _buildErrorLoggerProvider(),
      ..._buildDioProviders(),
      ..._buildExternalLoggerProviders(),
      ..._builDatasourcesProviders(),
      ..._buildRepositoryProviders(),
      ..._buildUsecasesProviders(),
    ],
    child: widget.builder(context),
  );

  SingleChildWidget _buildErrorLoggerProvider() => Provider<ErrorLogger>(
    create: (context) => widget.errorLogger,
  );

  List<SingleChildWidget> _buildDioProviders() => [
    Provider<APIClient>(
      create: (context) => APIClient(),
    ),
  ];

  List<SingleChildWidget> _buildExternalLoggerProviders() => [];

  List<SingleChildWidget> _builDatasourcesProviders() => [
    Provider<GamesLocalDatasource>(
      create: (context) => GamesLocalDatasourceImpl(),
    ),
    Provider<GamesRemoteDatasource>(
      create: (context) =>
          GamesRemoteDatasourceImpl(context.read()),
    ),
  ];

  List<SingleChildWidget> _buildRepositoryProviders() => [
    ProxyProvider<GamesRemoteDatasource, GamesRemoteRepository>(
      update: (_, gamesDatasource, gamesRepository) =>
      gamesRepository ?? GamesRemoteRepositoryImpl(gamesDatasource),
    ),
    ProxyProvider<GamesLocalDatasource, GamesLocalRepository>(
      update: (_, gamesDatasource, gamesRepository) =>
      gamesRepository ?? GamesLocalRepositoryImpl(gamesDatasource),
    ),
  ];

  List<SingleChildWidget> _buildUsecasesProviders() => [
    ProxyProvider<GamesRemoteRepository, GamesRemoteUsecase>(
      update: (_, gamesRepository, __) =>
          GamesRemoteUsecase(repository: gamesRepository),
    ),
    ProxyProvider2<GamesRemoteRepository,  GamesLocalRepository, GamesLocalUsecase>(
      update: (_, gamesRemoteRepository, gamesLocalRepository, __) =>
          GamesLocalUsecase(repositoryLocal: gamesLocalRepository,
              repositoryRemote: gamesRemoteRepository),
    ),
  ];

  @override
  void dispose() {
    super.dispose();
  }
}
