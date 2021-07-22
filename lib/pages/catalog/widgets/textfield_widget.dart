import 'dart:async';
import 'package:flutter/services.dart';

import '../../../export.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final int maxLines;
  final bool digit;
  final bool decimal;
  final Function(String) onChanged;
  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.text,
    this.maxLines = 1,
    this.digit = false,
    this.decimal = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  Timer? _debounce;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        inputFormatters: [
          if (widget.digit)
            FilteringTextInputFormatter.allow(
                RegExp(widget.decimal ? r'[0-9.]' : r'[0-9]'))
        ],
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: widget.label,
        ),
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(
              const Duration(milliseconds: 500), () => widget.onChanged(value));
        },
      ),
    );
  }
}
