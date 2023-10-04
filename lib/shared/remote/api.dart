import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/category_model.dart';
import 'package:movie/model/details_model.dart';
import 'package:movie/model/popular_model.dart';
import 'package:movie/model/recomended_model.dart';
import 'package:movie/model/up_coming_model.dart';

class Api {
  static Future<Popular> getPopular() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/popular",
        {"api_key": "355101bf4515fd622f26d629d69034cd"});
    var response = await http.get(url);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    Popular popularResponse = Popular.fromJson(jsonData);
    return popularResponse;
  }

  static Future<Popular> getSearch(String query) async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/popular",
        {"api_key": "355101bf4515fd622f26d629d69034cd"});
    var response = await http.get(url);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    Popular popularResponse = Popular.fromJson(jsonData);
    return popularResponse;
  }

  static Future<Category> getCategories() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/genre/movie/list",
        {"api_key": "355101bf4515fd622f26d629d69034cd"});
    var response = await http.get(url);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    Category categoryResponse = Category.fromJson(jsonData);
    return categoryResponse;
  }

  static Future<Details> getDetails() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/231",
        {"api_key": "355101bf4515fd622f26d629d69034cd"});
    var response = await http.get(url);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    Details detailsResponse = Details.fromJson(jsonData);
    return detailsResponse;
  }

  static Future<Recomended> getRecomended() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/top_rated",
        {"api_key": "355101bf4515fd622f26d629d69034cd"});
    var response = await http.get(url);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    Recomended recomendedResponse = Recomended.fromJson(jsonData);
    return recomendedResponse;
  }

  static Future<UpComing> getUpComing() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/upcoming",
        {"api_key": "355101bf4515fd622f26d629d69034cd"});
    var response = await http.get(url);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    UpComing upComingResponse = UpComing.fromJson(jsonData);
    return upComingResponse;
  }
}
