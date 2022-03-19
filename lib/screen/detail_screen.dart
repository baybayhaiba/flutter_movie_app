import 'package:flutter/material.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/widget/custom_image.dart';

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
            child: Container(
              height: 1000,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [

                          ],
                        ),
                      )
                    ],
                  )
                ],
              ) ,
              decoration: const BoxDecoration(borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
