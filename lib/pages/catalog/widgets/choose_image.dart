import 'dart:io';

import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../pages.dart';

class ChooseImage extends StatefulWidget {
  final String? imageUrl;
  final Function(String) onSelected;
  const ChooseImage({
    Key? key,
    this.imageUrl,
    required this.onSelected,
  }) : super(key: key);

  @override
  _ChooseImageState createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  final _picker = ImagePicker();
  PickedFile? _image;
  String? imagePath;

  Future<String> _openImageFile() async {
    final typeGroup = XTypeGroup(
      label: 'images',
      extensions: ['jpg', 'png'],
    );
    final files = await FileSelectorPlatform.instance
        .openFiles(acceptedTypeGroups: [typeGroup]);
    final file = files[0];
    final fileName = file.name;
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.imageUrl);
    return GestureDetector(
      onTap: () async {
        if (kIsWeb) {
          _image = await _picker.getImage(source: ImageSource.gallery);
          imagePath = _image?.path;
          if (imagePath != null) widget.onSelected(imagePath!);
        } else {
          imagePath = await _openImageFile();
          if (imagePath != null) widget.onSelected(imagePath!);
        }
        setState(() {});
      },
      child: Container(
          margin: EdgeInsets.all(8),
          height: 250,
          width: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
              image: widget.imageUrl != null
                  ? widget.imageUrl!.isNotEmpty
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.imageUrl!))
                      : imagePath != null
                          ? kIsWeb
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imagePath!))
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(imagePath!)))
                          : null
                  : null),
          child: widget.imageUrl == null || imagePath == null
              ? Text('Upload a Image')
              : null),
    );
  }
}
