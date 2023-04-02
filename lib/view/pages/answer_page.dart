import 'package:alda3ia/constents/my_colors.dart';
import 'package:alda3ia/constents/my_sizes.dart';
import 'package:alda3ia/constents/my_texts.dart';
import 'package:alda3ia/controller/theme_ctr.dart';
import 'package:alda3ia/view/components/copy_text.dart';
import 'package:alda3ia/view/components/my_app_bar.dart';
import 'package:alda3ia/view/components/zoom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AnswerPage extends GetView<ThemeCtr> {
  AnswerPage({super.key, required this.title, required this.body});
  String title;
  String body;
  @override
  Widget build(BuildContext context) {
    context.theme;
    return Scaffold(
      appBar: MyAppBar(title: title, actions: [CopyToClipBoard(text: body)]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySizes.screenPaddingH, vertical: MySizes.screenPaddingV),
            child: Card(
              color: MyColors.background(),
              elevation: 5,
              child: Center(
                child: MyTexts.header(title: title, textAlign: TextAlign.center),
              ),
            ),
          ),
          Expanded(
            child: ZoomText(
              text: body,
              textAlign: (title == "فضل الدعوة إلى اللَّه" || title == "خطوات الدعوة ومهارات الداعية")
                  ? TextAlign.end
                  : TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
