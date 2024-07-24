import 'dart:convert';

import 'package:anuflix/const/const_color.dart';
import 'package:anuflix/model/genre_model.dart';
import 'package:anuflix/model/movie_model.dart';
import 'package:http/http.dart' as http;

class Api {
  final discoverApi =
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey';
  final nowPlayingApi =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';
  final popularApi =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  final upcomingApi =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  final topRatedApi =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  final genreApi =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey';
  final detailApi = 'https://api.themoviedb.org/3/movie/12?api_key=$apiKey';

  Future<List<Movie>> getDiscover() async {
    final response = await http.get(Uri.parse(discoverApi));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load Discover Movies');
    }
  }

  Future<List<Movie>> getNowPlaying() async {
    final response = await http.get(Uri.parse(nowPlayingApi));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load Now Playing Movies');
    }
  }

  Future<List<Movie>> getPopular() async {
    final response = await http.get(Uri.parse(popularApi));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load Popular Movies');
    }
  }

  Future<List<Movie>> getUpcoming() async {
    final response = await http.get(Uri.parse(upcomingApi));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load Upcoming Movies');
    }
  }

  Future<List<Movie>> getTopRated() async {
    final response = await http.get(Uri.parse(topRatedApi));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load Top Rated Movies');
    }
  }

  Future<List<Genre>> getGenre() async {
    final response = await http.get(Uri.parse(genreApi));
    if (response.statusCode == 200) {
      final List<dynamic> genresJson = json.decode(response.body)['genres'];
      return genresJson.map((json) => Genre.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load genres');
    }
  }
}
