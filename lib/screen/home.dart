import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/widget/movie_popular_item.dart';

import '../bloc/movie_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final bloc = MovieBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          primary: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(16), children: [
          Text(
            'Popular',
            style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          buildPopularMovies(),

          const SizedBox(
            height: 30,
          ),

          Text(
            'Up coming',
            style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(
            height: 30,
          ),

          buildUpcomingMovies(),
        ]),
      ),
    );
  }

  Widget buildPopularMovies() {
    return StreamBuilder<Object>(
      stream: bloc.moviePopularStream,
      builder: (context, snapshot) {
        Movie? movie = snapshot.data as Movie?;
        if (movie != null) {
          return CarouselSlider(
              items: List.generate(
                  10,
                  (index) => MovieItem(
                        result: movie.results![index],
                        radius: 10,
                      )),
              options: CarouselOptions(
                  height: 350,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: 0.75));
        }

        return Container(
          height: 500,
          color: Colors.red,
        );
      },
    );
  }

  Widget buildUpcomingMovies() {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return Container(
          color: Colors.grey,
          height: 200,
          width: 100,
        );
      },
      separatorBuilder: (ctx, index) {
        return SizedBox(
          height: 8,
        );
      },
      itemCount: 10,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
