class Genre {
  int? id;
  String? name;
  int? game;

  Genre({
    this.id,
    this.name,
    this.game
  });

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  factory Genre.fromJSON(Map<dynamic, dynamic> map) {

    Genre genre = Genre(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      game: map['game']?.toInt() ?? 0,
    );

    return genre;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['game'] = game;
    return data;
  }
}