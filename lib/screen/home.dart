import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/route/movie_router.dart';
import 'package:movie_app/widget/movie_popular_item.dart';
import 'package:movie_app/widget/movie_upcoming_item.dart';

import '../bloc/movie_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final bloc = MovieBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular',
                style:
                    GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
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
                style:
                    GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              buildUpcomingMovies(),
            ],
          ),
        ),
      ),
    );
  }

  void onTapMovie(Result result, BuildContext context) {
    MovieRoute.goToPage(context: context, page: PageUI.detail, data: Bundle(key: result.id.toString(), data: result));
  }

  Widget buildPopularMovies() {
    return StreamBuilder<Object>(
      stream: bloc.moviePopularStream,
      builder: (context, snapshot) {
        Movie? movie = snapshot.data as Movie?;
        if (movie != null) {
          return CarouselSlider(
              items: List.generate(
                movie.results?.length ?? 0,
                (index) => MovieItem(
                  result: movie.results![index],
                  radius: 10,
                  onTap: () {
                    onTapMovie(movie.results![index], context);
                  },
                ),
              ),
              options: CarouselOptions(
                  height: 350,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: 0.75));
        }

        return SizedBox();
      },
    );
  }

  Widget buildUpcomingMovies() {
    return StreamBuilder<Movie>(
        stream: bloc.movieUpcomingStream,
        builder: (context, snapshot) {
          Movie? movie = snapshot.data as Movie?;

          if (movie != null) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                return MovieUpComingItem(
                  result: movie.results![index],
                  onTap: () {
                    onTapMovie(movie.results![index], context);
                  },
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: movie.results?.length ?? 0,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
            );
          }

          return SizedBox();
        });
  }
}
