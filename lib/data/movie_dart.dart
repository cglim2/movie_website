import 'dart:convert';
import 'package:movie_website/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieData {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final String bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2QwY2Y0MDdiOWIzYTNlOGMxN2NlMTYwNzBmODA1MiIsIm5iZiI6MTc2NzczOTc1My4xMzkwMDAyLCJzdWIiOiI2OTVkOTE2OTA2Yjg2MTcwZTJiNWRkMTEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.lNwUm8UEKj0AMIkb1h2KymgVZAv_89mm5w1A086hDgY';

  Future<List<MovieModel>> fetchTopRatedMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/top_rated?language=en-US&page=1'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      //print(response.body);
      return ((jsonDecode(response.body)['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList());
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  Future<List<MovieModel>> fetchNowPalyingMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/now_playing?language=en-US&page=1'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      //print(response.body);
      return ((jsonDecode(response.body)['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList());
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  Future<List<MovieModel>> fetchpopularmovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/popular?language=en-US&page=1'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      //print(response.body);
      return ((jsonDecode(response.body)['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList());
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }
}
