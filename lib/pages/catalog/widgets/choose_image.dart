import 'package:image_picker/image_picker.dart';
import '../../../../../../pages.dart';

class ChooseImage extends StatefulWidget {
  final String? imageUrl;
  const ChooseImage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  _ChooseImageState createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  final _picker = ImagePicker();
  PickedFile? _image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _image = await _picker.getImage(source: ImageSource.gallery);
        setState(() {});
      },
      child: Container(
          margin: EdgeInsets.all(8),
          height: 200,
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
              image: widget.imageUrl != null
                  ? DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.imageUrl!))
                  : _image != null
                      ? DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(_image!.path))
                      : null),
          child: widget.imageUrl == null && _image == null
              ? Text('Upload a Image')
              : null),
    );
  }
}
