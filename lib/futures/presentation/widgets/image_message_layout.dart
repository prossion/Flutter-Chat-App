import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_app/common/full_photo_widget.dart';

class ImageMessageLayout extends StatelessWidget {
  const ImageMessageLayout({
    Key? key,
    required this.imageUrl,
    required this.time,
    required this.color,
    required this.align,
    required this.boxAlign,
    required this.nip,
    required this.crossAlign,
    this.name,
    required this.alignName,
    this.image,
  }) : super(key: key);
  final String imageUrl;
  final File? image;
  final String time;
  final Color color;
  final TextAlign align;
  final CrossAxisAlignment boxAlign;
  final BubbleNip nip;
  final CrossAxisAlignment crossAlign;
  final String? name;
  final TextAlign alignName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.90,
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(3),
            child: Bubble(
              color: color,
              nip: nip,
              child: Column(
                crossAxisAlignment: crossAlign,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$name",
                    textAlign: alignName,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      // height: MediaQuery.of(context).size.width * 0.4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FullPhotoPage(url: imageUrl),
                            ),
                          );
                        },
                        child: image != null
                            ? Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: imageUrl,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.blueGrey.shade200,
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Error, there was no picture',
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Text(
                    time,
                    textAlign: align,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
