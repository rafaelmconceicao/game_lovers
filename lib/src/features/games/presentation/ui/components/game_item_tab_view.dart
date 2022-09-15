import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_lovers/src/features/games/domain/usecase/games_local_usecase.dart';
import 'package:game_lovers/src/features/games/presentation/bloc/home_bloc.dart';
import 'package:game_lovers/src/features/games/presentation/bloc/home_state.dart';
import 'package:game_lovers/src/features/games/presentation/ui/pages/detail_game.dart';
import 'package:game_lovers/src/utils/helper/gl_colors.dart';
import 'package:game_lovers/src/utils/helper/gl_text_styles.dart';
import 'package:game_lovers/src/utils/ui/components/async_snapshot_response_view.dart';
import 'package:game_lovers/src/utils/ui/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class GameItemTabView extends StatelessWidget {
  const GameItemTabView({
    required this.bloc,
    required this.types,
    Key? key,
  }) : super(key: key);

  final HomeBloc bloc;
  final Types types;

  static Widget create({
    required Types types,
  }) =>
      ProxyProvider<GamesLocalUsecase, HomeBloc>(
        update: (
            _,
            homeUsecase,
            currentBloc,
            ) =>
        currentBloc ??
            HomeBloc(
              types: types,
              usecase: homeUsecase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<HomeBloc>(
          builder: (_, bloc, __) => GameItemTabView(bloc: bloc, types: types),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeState>(
      stream: bloc.onNewState,
      builder: (_, snapshot) =>
          AsyncSnapshotResponseView<Loading, Error, Success>(
            snapshot: snapshot,
            successWidgetBuilder: (_, success) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: success.games.length,
                  itemBuilder: (context, index) {
                    final item = success.games[index];
                    final imageUrl = 'http:${item.screenshots}';
                    var platform = '';

                    if(item.platform == TypeExtension(types).idPlatform){
                      platform = TypeExtension(types).names;
                    }

                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailGame(game: item, imageUrl: imageUrl, platform: platform,),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: GLColors.brightGray,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            item.screenshots == null ? Container(
                              width: 130,
                              height: 90,
                              alignment: Alignment.center,
                              child: const Center(
                                child: Icon(Icons.error_outline, size: 50),
                              ),
                            ) :
                            Center(
                              child: CachedNetworkImage(
                                width: 130,
                                height: 90,
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder: (context, url, progress) =>
                                    const LoadingView( width: 130, height: 90,),
                                imageBuilder: (context, imageProvider) => DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                item.name!,
                                style: GLTextStyles.titleGame,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      )
                    );
                  },
                ),
              ),
            ),
            errorWidgetBuilder: (context, _) => const Center(
              child: Text('Error'),
            ),
            loadingWidgetBuilder: (context, _) =>
            const Center(child: CircularProgressIndicator(color: GLColors.royalGreen)),
          ),
    );
  }
}

