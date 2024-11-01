import 'dart:convert';

import 'package:movieapp/models/moviemodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String imgUrl = ' https://image.tmdb.org/t/p/w500';
  static const String detailUrl =
      ' https://movies-api.nomadcoders.workers.dev/movie?id';

  static Future<List<Moviemodel>> getPopularMovie() async {
    List<Moviemodel> popularInstances = [];
    final url = Uri.parse('$baseUrl/popular');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        popularInstances.add(Moviemodel.fromJson(movie));
      }

      return popularInstances;
    }
    throw Error();
  }

  static Future<List<Moviemodel>> getNowMovie() async {
    List<Moviemodel> nowInstances = [];
    final url = Uri.parse('$baseUrl/now-playing');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        nowInstances.add(Moviemodel.fromJson(movie));
      }

      return nowInstances;
    }
    throw Error();
  }

  static Future<List<Moviemodel>> getSoon() async {
    List<Moviemodel> nowInstances = [];
    final url = Uri.parse('$baseUrl/coming-soon');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        nowInstances.add(Moviemodel.fromJson(movie));
      }

      return nowInstances;
    }
    throw Error();
  }
}
