
class Search {
  int? page;
  List<dynamic>? results;
  int? totalPages;
  int? totalResults;

  Search({this.page, this.results, this.totalPages, this.totalResults});

  Search.fromJson(Map<String, dynamic> json) {
    if(json["page"] is int) {
      page = json["page"];
    }
    if(json["results"] is List) {
      results = json["results"] ?? [];
    }
    if(json["total_pages"] is int) {
      totalPages = json["total_pages"];
    }
    if(json["total_results"] is int) {
      totalResults = json["total_results"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    if(results != null) {
      _data["results"] = results;
    }
    _data["total_pages"] = totalPages;
    _data["total_results"] = totalResults;
    return _data;
  }
}