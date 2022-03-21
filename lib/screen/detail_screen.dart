import 'package:flutter/material.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/widget/custom_image.dart';
import 'package:movie_app/widget/movie_detail_item.dart';

class DetailScreen extends StatelessWidget {
  final Result result;

  const DetailScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomImage(image: result.getImage()),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: MovieDetailItem(
                result: result,
              ),
            ),
          )
        ],
      ),
    );
  }
}
