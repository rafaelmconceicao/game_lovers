import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';
import 'package:game_lovers/src/utils/helper/gl_colors.dart';
import 'package:game_lovers/src/utils/helper/gl_text_styles.dart';
import 'package:game_lovers/src/utils/ui/widgets/loading_view.dart';

class DetailGame extends StatelessWidget {
  const DetailGame({Key? key, required this.game, required this.imageUrl, required this.platform}) : super(key: key);
  final Games game;
  final String imageUrl;
  final String platform;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CachedNetworkImage(
                  height: 200,
                  width: 300,
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  errorWidget: (_, __, ___) => Container(
                    height: 200,
                    width: 300,
                    color: GLColors.royalGreen,
                  ),
                  progressIndicatorBuilder: (context, url, progress) =>
                  const LoadingView( height: 300, width: 200,),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Center(
                child: Text(game.name!, style: GLTextStyles.titleGameDetail,),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Text('Genre: ', style: GLTextStyles.gameInformations,),
                  game.genres!.isEmpty? const Text('No data', style: GLTextStyles.gameInformations,) :
                  Text(game.genres!.first.name!, style: GLTextStyles.gameInformations,)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text('Platform: ', style: GLTextStyles.gameInformations,),
                  Text( platform, style: GLTextStyles.gameInformations,),
                ],
              ),
              const SizedBox(height: 20,),
              const Divider(color: GLColors.brightGray, thickness: 3),
              const SizedBox(height: 20,),
              Text(game.summary == null ? 'No data' : game.summary!, style: GLTextStyles.gameInformations,),
            ],
          ),
        ),
      ),
    );
  }
}
