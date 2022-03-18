import 'package:flutter/material.dart';
import 'package:movie_app/widget/movie_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildMovies()
    ],);
  }


  Widget buildMovies() {
    return ListView.separated(itemBuilder: (ctx, index) {
      return MovieItem();
    }, separatorBuilder: (ctx, index) {
      return SizedBox(height: 10,);
    }, itemCount: 10,
      scrollDirection: Axis.horizontal,);
  }
}

