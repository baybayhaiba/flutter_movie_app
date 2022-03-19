import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/widget/custom_image.dart';

class MovieUpComingItem extends StatelessWidget {
  const MovieUpComingItem(
      {Key? key, required this.result, this.radius = 15, this.onTap})
      : super(key: key);

  final Result result;
  final GestureTapCallback? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Column(
          children: [
            CustomImage(
              image: result.getImage(),
              radius: radius,
              isJustBorderTop: true,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTitle(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildDateRealease(),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Text buildTitle() {
    return Text(
      result.title ?? '',
      style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Align buildDateRealease() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(result.releaseDate ?? '',
          style: GoogleFonts.lato(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}
