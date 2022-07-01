import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

Image CustomImage(String path, {BoxFit fit = BoxFit.contain}) {
  return Image(
    image: CustomAdvanceNetworkImage(path),
    fit: fit,
    errorBuilder:
        ( context,  exception,  stackTrace) {
      return Container();
    },
  );
}

dynamic CustomAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}