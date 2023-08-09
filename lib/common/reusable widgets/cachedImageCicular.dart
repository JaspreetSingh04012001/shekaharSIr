import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheProfileImage extends StatelessWidget {
  //const CacheProfileImage({super.key});
  String url;
  double radius;
  double? height;
  CacheProfileImage({super.key, required this.url, required this.radius, this.height});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        width: radius,
        height: radius,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Image.network(
          "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
