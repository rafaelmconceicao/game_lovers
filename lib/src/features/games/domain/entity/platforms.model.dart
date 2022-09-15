class Platforms {
  int? id;
  String? alternativeName;
  int? category;
  int? createdAt;
  String? name;
  int? platformLogo;

  Platforms(
      {this.id,
        this.alternativeName,
        this.category,
        this.createdAt,
        this.name,
        this.platformLogo,
      });

  Platforms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alternativeName = json['alternative_name'];
    category = json['category'];
    createdAt = json['created_at'];
    name = json['name'];
    platformLogo = json['platform_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['alternative_name'] = alternativeName;
    data['category'] = category;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['platform_logo'] = platformLogo;
    return data;
  }
}