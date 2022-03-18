import 'package:flutter/material.dart';
import 'package:movie_app/route/movie_router.dart';
import 'package:movie_app/screen/home.dart';
import 'package:movie_app/theme.dart';

void main() => runApp(const MovieApp());


class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'MovieApp',
      home: Home(),
      theme: FooderlichTheme.dark(),
      //onGenerateRoute: (routeSettings) => MovieRoute().onGenerateRoute(routeSettings),
    );
  }
}


