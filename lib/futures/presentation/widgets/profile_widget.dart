import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget profileWidget({String? imageUrl, File? image, String? name}) {
  if (image == null) {
    if (imageUrl == null) {
      return Image.asset(
        'assets/icons/profile_default.png',
        fit: BoxFit.cover,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
          height: 50,
          width: 50,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: const CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.black12,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$name', overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
      );
    }
  } else {
    return Image.file(
      image,
      fit: BoxFit.cover,
    );
  }
}
