import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void copy(String text) {
  Clipboard.setData(ClipboardData(text: text));
}

class CopyToClipBoard extends StatelessWidget {
  final String text;

  const CopyToClipBoard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        copy(text);
      },
      icon: Icon(Icons.copy_all),
    );
  }
}
