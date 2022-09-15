import 'package:flutter/material.dart';
import 'package:game_lovers/src/core/error_logger.dart';
import 'package:game_lovers/src/core/general_provider.dart';
import 'package:game_lovers/src/features/games/presentation/ui/pages/home_page.dart';
import 'package:game_lovers/src/utils/helper/gl_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final errorLogger = ErrorLogger();

  runApp(
    GeneralProvider(
      builder: (_) => const GamesApp(),
      errorLogger: errorLogger.logError,
    ),
  );
}

class GamesApp extends StatelessWidget {
  const GamesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Game Lovers',
        theme: ThemeData(
          primarySwatch: GLColors.materialThemePrimarySwatch,
        ),
      home: const Home()
    );
  }
}


