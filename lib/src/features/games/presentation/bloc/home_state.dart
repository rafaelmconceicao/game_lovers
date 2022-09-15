import 'package:game_lovers/src/features/games/domain/entity/games.model.dart';

abstract class HomeState {}

class Success implements HomeState {
  const Success({
    required this.games,

  });

  final List<Games> games;
}

class Loading implements HomeState {}

class Error implements HomeState {}


extension TypeExtension on Types {
  int get idPlatform {
    switch (this) {
      case Types.nintendo:
        return 130;
      case Types.xbox:
        return 49;
      case Types.playStation:
        return 48;
      case Types.windows:
        return 6;
      case Types.ios:
        return 39;
      case Types.android:
        return 34;
      default:
        return 0;
    }
  }

  String get names {
    switch (this) {
      case Types.xbox:
        return 'X-Box';
      case Types.nintendo:
        return 'Nintendo';
      case Types.ios:
        return 'IOS';
      case Types.windows:
        return 'Windows';
      case Types.playStation:
        return 'PlayStation';
      case Types.android:
        return 'Android';
      default:
        return '';
    }
  }
}

enum Types { xbox, nintendo, ios, windows, playStation, android }