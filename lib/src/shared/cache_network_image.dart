import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CsCacheNetImg extends StatelessWidget {
  final String url;
  const CsCacheNetImg({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) =>
          CircularProgressIndicator(
        value: progress.progress,
        strokeWidth: 15,
      ),
    );
  }
}
