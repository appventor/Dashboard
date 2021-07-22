import 'dart:io';

import 'package:dashboard/pages/catalog/products/model/models.dart';
import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../export.dart';

class ChooseImages extends StatefulWidget {
  final List<String> images;
  final Function onSelected;
  const ChooseImages({
    Key? key,
    required this.images,
    required this.onSelected,
  }) : super(key: key);

  @override
  _ChooseImagesState createState() => _ChooseImagesState();
}

class _ChooseImagesState extends State<ChooseImages> {
  final _picker = ImagePicker();
  PickedFile? _image;
  String? imagePath;
  int _currentIndex = 0;
  late List<ImageModel> images;

  @override
  void initState() {
    super.initState();
    images = List.from(
        widget.images.map((image) => ImageModel(path: image, url: true)));
    setState(() {});
  }

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

  void pickImage() async {
    if (kIsWeb) {
      _image = await _picker.getImage(source: ImageSource.gallery);
      if (_image != null) {
        images.add(ImageModel(path: _image!.path, url: false));
        widget.onSelected(images);
        setState(() {});
      }
    } else {
      imagePath = await _openImageFile();
      if (imagePath != null) {
        images.add(ImageModel(path: imagePath!, url: false));
        widget.onSelected(images);
        setState(() {});
      }
    }
  }

  DecorationImage loadImage(ImageModel image) {
    if (image.url) {
      return DecorationImage(
          fit: BoxFit.cover, image: NetworkImage(image.path));
    } else {
      if (kIsWeb) {
        return DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(image.path));
      } else {
        return DecorationImage(
            fit: BoxFit.cover, image: FileImage(File(image.path)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          // onTap: () => pickImage(),
          child: Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.all(8),
              height: 250,
              width: 250,
              alignment: images.isEmpty ? Alignment.center : Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
                image:
                    images.isNotEmpty ? loadImage(images[_currentIndex]) : null,
              ),
              child: images.isEmpty
                  ? const Text('Upload Images')
                  : IconButton(
                      onPressed: () {
                        images.removeAt(_currentIndex);
                        setState(() {
                          --_currentIndex;
                          if (_currentIndex < 0) _currentIndex = 0;
                        });
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      tooltip: 'Delete',
                    )),
        ),
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      images.length,
                      (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: _currentIndex == index
                                        ? Colors.blue
                                        : Colors.grey),
                                image: images.isNotEmpty
                                    ? loadImage(images[index])
                                    : null,
                              ),
                            ),
                          )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () => pickImage(),
                  child: const Icon(
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
