import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dmi_practica09_200070/common/Constants.dart';
import 'package:dmi_practica09_200070/model/Media.dart';

class HttpHandler {
  static final _httpHandler = HttpHandler();
  final String _baseUrl = "api.themoviedb.org";
  final String _lenguaje = "es-MX";

  static HttpHandler get(){
    return _httpHandler;
  }

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies() {
    var uri = Uri.https(_baseUrl, "3/movie/popular",
        {'api_key': API_KEY, 'page': "1", 'language': _lenguaje});

    return getJson(uri).then(
        ((data) => data['results'].map<Media>((item) => Media(item, MediaType.movie)).toList()));
  }

  Future<List<Media>> fetchShow() {
    var uri = Uri.https(_baseUrl, "3/tv/popular",
        {'api_key': API_KEY, 'page': "1", 'language': _lenguaje});

    return getJson(uri).then(
        ((data) => data['results'].map<Media>((item) => Media(item, MediaType.show)).toList()));
  }

}
