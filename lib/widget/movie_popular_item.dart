import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/widget/custom_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem(
      {Key? key, required this.result, this.radius = 15, this.onTap})
      : super(key: key);
  final Result result;
  final double radius;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(children: [
          CustomImage(
            image: result.getImage(),
            title: result.title,
            radius: radius,
          ),
          Positioned(
            child: buildVoteAverage(),
            right: 10,
            top: 10,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildTitle(),
          ),
        ]),
      ),
    );
  }

  Container buildTitle() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
          color: Colors.black.withOpacity(0.7)),
      height: 70,
      alignment: Alignment.center,
      child: Text(result.title ?? '',
          style: GoogleFonts.lato(fontSize: 24), textAlign: TextAlign.center),
    );
  }

  Container buildVoteAverage() {
    return Container(
      width: 40,
      height: 40,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.blueGrey),
      child: Text(
        result.voteAverage?.toString() ?? '0.0',
        style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.center,
    );
  }
}
