import 'package:game_lovers/src/core/subscription_holder.dart';
import 'package:game_lovers/src/features/games/domain/usecase/games_local_usecase.dart';
import 'package:game_lovers/src/features/games/presentation/bloc/home_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc with SubscriptionHolder {
  HomeBloc({
    required this.usecase,
    required this.types
  }) {
    Rx.merge([
      _getMoviesData(),
      _onRefreshDataSubject.flatMap((_) => _refreshData()),
    ]).listen(
      _onNewStateSubject.add,
    ).addTo(subscriptions);
  }

  final GamesLocalUsecase usecase;
  Types types;

  final _onNewStateSubject = BehaviorSubject<HomeState>();
  Stream<HomeState> get onNewState => _onNewStateSubject.stream;

  final _onRefreshDataSubject = PublishSubject<void>();
  Sink<void> get onRefreshData => _onRefreshDataSubject.sink;

  Stream<HomeState> _getMoviesData() async* {
    yield Loading();
    try {
      yield* _refreshData();
    } catch (_) {
      yield Error();
    }
  }

  Stream<HomeState> _refreshData() async* {
    final lastState = _onNewStateSubject.value;
    try {
      yield* _fetchInfos();
    } catch (_) {
      yield lastState;
    }
  }

  Stream<HomeState> _fetchInfos() async* {
    yield Loading();
    try {

      final games = await usecase.getGamesLocal(
        idPlatform: TypeExtension(types).idPlatform,
      );

      yield Success(
        games: games,
      );
    } catch (error) {
      yield Error();
    }
  }

  void dispose() {
    _onNewStateSubject.close();
    _onRefreshDataSubject.close();
    disposeAll();
  }
}
