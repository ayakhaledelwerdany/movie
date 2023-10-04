class Category {
  List<Genres>? genres;

  Category({this.genres});

  Category.fromJson(Map<String, dynamic> json) {
    if (json["genres"] is List) {
      genres = json["genres"] == null
          ? null
          : (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (genres != null) {
      _data["genres"] = genres?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}
