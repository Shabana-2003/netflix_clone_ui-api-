import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/model/movies/movie/movie.dart';

const String _trendingUrl =
    "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey";
const String _topRatedUrl =
    "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";
const String _upComing =
    "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
const String _top10TvShowsInIndiaToday =
    "https://api.themoviedb.org/3/discover/tv?api_key=$apiKey&with_original_language=hi&sort_by=popularity.desc";
const String _forSearch =
    "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey";
const String fastLaugh =
    "https://run.mocky.io/v3/23fd5bde-1748-4a5d-98c3-5513fb8bdca0";

//get api request
class Api {
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<String?>> getDownloadImageUrls() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData
          .map((movie) => Movie.fromJson(movie).posterPath)
          .toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> getTopRated() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> getUpComing() async {
    final response = await http.get(Uri.parse(_upComing));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> getTop10TvShowsInIndiaToday() async {
    final response = await http.get(Uri.parse(_top10TvShowsInIndiaToday));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> forSearchDara() async {
    final response = await http.get(Uri.parse(_forSearch));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> searchResult(String movie) async {
    String resultApi =
        "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$movie";
    final response = await http.get(Uri.parse(resultApi));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<List<String>> getFastLaughVideoUrls() async {
    final response = await http.get(Uri.parse(fastLaugh));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["videoUrls"] as List;
      return responseData.map((videoUrl) => videoUrl as String).toList();
    } else {
      throw Exception('something went wrong');
    }
  }
}
