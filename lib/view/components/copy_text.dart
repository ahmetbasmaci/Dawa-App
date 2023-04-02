import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CopyToClipBoard extends StatelessWidget {
  final String text;

  const CopyToClipBoard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        copy(text);
        Get.snackbar('Copied', 'Copied to clipboard', snackPosition: SnackPosition.BOTTOM);
      },
      icon: Icon(Icons.copy_all),
    );
  }

  void copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
