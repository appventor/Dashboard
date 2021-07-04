import 'dart:io';

import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../pages.dart';

class ChooseImages extends StatefulWidget {
  final List<String>? images;
  final Function onSelected;
  const ChooseImages({
    Key? key,
    this.images,
    required this.onSelected,
  }) : super(key: key);

  @override
  _ChooseImagesState createState() => _ChooseImagesState();
}

class _ChooseImagesState extends State<ChooseImages> {
  final _picker = ImagePicker();
  PickedFile? _image;
  String? imagePath;
  String? imageUrl;
  DecorationImage? image;

  Future<String> _openImageFile() async {
    final typeGroup = XTypeGroup(
      label: 'images',
      extensions: ['jpg', 'png'],
    );
    final files = await FileSelectorPlatform.instance
        .openFiles(acceptedTypeGroups: [typeGroup]);
    final file = files[0];
    return file.path;
  }

  loadImage() {
    if (imageUrl != null) {
      image =
          DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl!));
    } else if (imagePath != null) {
      image = kIsWeb
          ? DecorationImage(fit: BoxFit.cover, image: NetworkImage(imagePath!))
          : DecorationImage(
              fit: BoxFit.cover, image: FileImage(File(imagePath!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(8),
            height: 250,
            width: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
              image: image,
            ),
            child: imageUrl == null && imagePath == null
                ? Text('Upload Images')
                : null),
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 50,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.blue),
                        image: image,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 50,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
