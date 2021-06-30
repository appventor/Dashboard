import 'dart:async';

import 'package:dashboard/pages/catalog/category/controller/save_category_provider.dart';

import '../../../pages.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final int maxLines;
  final Function(String) onChanged;
  const TextFieldWidget({
    Key? key,
    required this.label,
    this.maxLines = 1,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: widget.maxLines,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: widget.label),
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(
              const Duration(milliseconds: 500), () => widget.onChanged(value));
        },
      ),
    );
  }
}
