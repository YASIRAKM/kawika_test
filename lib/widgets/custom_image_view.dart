import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Color bgColor;
  const CustomImageView({
    super.key,
    required this.image,
    this.height = 70,
    this.width = 70,
    this.bgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: 70,
      width: 70,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: imageProvider, fit: BoxFit.contain)),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Center(child: Icon(Icons.info)),
        );
      },
      placeholder: (context, url) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }
}
