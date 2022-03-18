import 'dart:convert';

import 'package:movie_app/model/movie.dart';
import 'package:http/http.dart' as Http;

import '../model/status.dart';
import '../util/const.dart';

class MovieService {
  static Future<Resource<Movie>> getMovie(
      {required MovieType type, page = 1}) async {
    try {
      final response =
          await Http.get(Uri.parse(movieUrl(type: type, page: page)));

      if (response.statusCode == 200) {
        var jsonDecodeString = jsonDecode(response.body);

        return Resource.success(data: Movie.fromJson(jsonDecodeString));
      }

      return Resource.fail(error: Exception('Cant get API'));
    } catch (error) {
      return Resource.fail();
    }
  }
}
