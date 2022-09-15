import 'package:flutter/material.dart';
import 'package:game_lovers/src/features/games/presentation/bloc/home_state.dart';
import 'package:game_lovers/src/features/games/presentation/ui/components/category_tab_bar.dart';
import 'package:game_lovers/src/features/games/presentation/ui/components/game_item_tab_view.dart';
import 'package:game_lovers/src/utils/helper/gl_text_styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Game Lovers App'),
          titleTextStyle: GLTextStyles.appBar,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const CategoryTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  GameItemTabView.create(
                    types: Types.nintendo,
                  ),
                  GameItemTabView.create(
                    types: Types.windows,
                  ),
                  GameItemTabView.create(
                    types: Types.xbox,
                  ),
                  GameItemTabView.create(
                    types: Types.playStation,
                  ),
                  GameItemTabView.create(
                    types: Types.ios,
                  ),
                  GameItemTabView.create(
                    types: Types.android,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
