import 'package:game_lovers/src/features/games/domain/entity/genre.model.dart';
import 'package:game_lovers/src/features/games/domain/entity/platforms.model.dart';

class Games {
  int? id;
  int? category;
  List<Genre>? genres = [];
  String? name;
  List<Platforms>? platforms = [];
  String? screenshots;
  String? summary;
  int? platform;

  Games(
      {this.id,
        this.category,
        this.genres,
        this.name,
        this.platforms,
        this.screenshots,
        this.summary,
        this.platform,
      });

  Games.fromJson(Map<String, dynamic> json) {
    String getScreenshots(List<dynamic> images) => images.first['url'];

    id = json['id'];
    category = json['category'];

    if (json['genres'] != null) {
      genres = [];
      genres = (json['genres'] as List).map((e) =>
          Genre.fromJson(e)).toList();
    }

    name = json['name'];

    if (json['platforms'] != null) {
      platforms = [];
      platforms = (json['platforms'] as List).map((e) =>
          Platforms.fromJson(e)).toList();
    }

    screenshots = json['screenshots'] != null ? getScreenshots(json['screenshots']) : null;
    summary = json['summary'];
    platform = platforms?.first.id;

  }

  factory Games.fromJSON(Map<dynamic, dynamic> map) {
    return Games(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        screenshots: map['screenshots'],
        summary: map['summary'],
        platform: map['platform']
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['name'] = name;
    data['screenshots'] = screenshots;
    data['summary'] = summary;
    data['platform'] = platform;
    return data;
  }
}