import 'dart:convert';

import 'package:movieapp/models/detailmodel.dart';
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
      print(movies);
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
    List<Moviemodel> soonInstances = [];
    final url = Uri.parse('$baseUrl/coming-soon');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        soonInstances.add(Moviemodel.fromJson(movie));
      }

      return soonInstances;
    }
    throw Error();
  }

  static Future<Detailmodel> getDetailInfo(String id) async {
    const baseUri = 'https://movies-api.nomadcoders.workers.dev/movie?id=';

    final url = Uri.parse('$baseUri$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final movieInstance = Detailmodel.fromJson(json); // JSON을 MovieDetail로 변환
      return movieInstance;
    }
    throw Exception('Failed to load movie details');
  }
}
