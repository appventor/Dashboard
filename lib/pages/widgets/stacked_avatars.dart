import 'dart:io';

import 'package:flutter/foundation.dart';

import '../catalog/products/model/models.dart';
import '../../export.dart';

class StackedAvatars extends StatelessWidget {
  final List<ImageModel> images;
  const StackedAvatars({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return images.isNotEmpty
        ? Row(
            children: [
              SizedBox(
                width: images.length > 3 ? 70 : 100,
                child: Stack(
                  children: List.generate(
                      3,
                      (index) => Positioned(
                          left: images.length > 3 ? (index * 12) : (index * 24),
                          child: CircleAvatar(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                            ),
                            backgroundImage: images[index].url
                                ? NetworkImage(images[index].path)
                                : kIsWeb
                                    ? NetworkImage(images[index].path)
                                    : FileImage(File(images[index].path))
                                        as ImageProvider,
                          ))),
                ),
              ),
              images.length > 3
                  ? Text(
                      "+ ${images.length - 3}\nmore",
                      textAlign: TextAlign.center,
                    )
                  : SizedBox()
            ],
          )
        : SizedBox();
  }
}
