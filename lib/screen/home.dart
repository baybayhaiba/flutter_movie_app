import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/widget/movie_item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  var movieTest = Movie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(16), children: [
          Text(
            'Popular',
            style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          buildMovies(),
        ]),
      ),
    );
  }

  Widget buildMovies() {
    return CarouselSlider(
        items: List.generate(
            10,
            (index) => MovieItem(
                  result: Result(),
                )),
        options: CarouselOptions(
            height: 350,
            enlargeCenterPage: true,
            disableCenter: true,
            viewportFraction: 0.75));
  }
}
