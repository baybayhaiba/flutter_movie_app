import 'dart:async';

import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/status.dart';
import 'package:movie_app/remote/movie_service.dart';
import 'package:movie_app/util/const.dart';

class MovieBloc {
  final _moviePopularController = StreamController<Movie>();

  StreamSink<Movie> get _moviePopularSink => _moviePopularController.sink;

  Stream<Movie> get moviePopularStream => _moviePopularController.stream;

  final _movieUpcomingController = StreamController<Movie>();

  StreamSink<Movie> get _movieUpcomingSink => _movieUpcomingController.sink;

  Stream<Movie> get movieUpcomingStream => _movieUpcomingController.stream;

  MovieBloc() {
    MovieService.getMovie(type: MovieType.popular).then((value) => {
          if (value.status == Status.success && value.data != null)
            {_moviePopularSink.add(value.data!)}
        });

    MovieService.getMovie(type: MovieType.upcomming).then((value) => {
          if (value.status == Status.success && value.data != null)
            {_movieUpcomingSink.add(value.data!)}
        });
  }
}
