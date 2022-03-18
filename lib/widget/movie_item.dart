import 'package:flutter/material.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/widget/custom_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key, required this.result,this.radius = 15}) : super(key: key);
  final Result result;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius),),
      child: Column(children: [
        CustomImage(image: result.getImage())
      ]),
    );
  }
}
