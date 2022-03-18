import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {Key? key,
      required this.image,
      this.width = 100,
      this.height = 100,
      this.bgColors,
      this.radius = 0,
      this.borderRadiusGeometry,
      this.boxFit = BoxFit.cover,
      this.shape,
      this.isNetwork = true})
      : super(key: key);

  final String image;
  final double width;
  final double height;
  final Color? bgColors;
  final double radius;
  final bool isNetwork;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final BoxFit boxFit;
  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    if (borderRadiusGeometry != null && shape != null) {
      Exception('Cant choose both border & shape');
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColors,
        borderRadius: borderRadiusGeometry ?? BorderRadius.circular(radius),
      ),
      child: isNetwork
          ? CachedNetworkImage(
              imageUrl: image,
              placeholder: (ctx, url) => BlankImageWidget(),
              errorWidget: (ctx, url, error) => BlankImageWidget(),
              imageBuilder: (ctx, imageProvider) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: boxFit),
                    borderRadius:
                        borderRadiusGeometry ?? BorderRadius.circular(radius)),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.asset(
                image,
                fit: boxFit,
              ),
            ),
    );
  }
}

class BlankImageWidget extends StatefulWidget {
  const BlankImageWidget({Key? key}) : super(key: key);

  @override
  _BlankImageWidgetState createState() => _BlankImageWidgetState();
}

class _BlankImageWidgetState extends State<BlankImageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Center(
          child: SizedBox(
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
        ),
      )),
    );
  }
}
