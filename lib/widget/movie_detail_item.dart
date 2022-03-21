import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/result.dart';

class MovieDetailItem extends StatelessWidget {
  const MovieDetailItem({Key? key, required this.result}) : super(key: key);
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            result.title ?? ' ',
            style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              result.originalTitle ?? '',
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),

          const SizedBox(height: 10,),

          Text(result.overview ?? ' '),
        ],
      ),
    );
  }
}
