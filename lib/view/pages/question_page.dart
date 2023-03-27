// import 'package:flutter/material.dart';
import 'package:alda3ia/constents/my_colors.dart';
import 'package:alda3ia/constents/my_texts.dart';
import 'package:alda3ia/model/models.dart';
import 'package:get/get.dart';
import 'package:alda3ia/view/components/my_app_bar.dart';
import '../../constents/my_sizes.dart';
import '../../controller/theme_ctr.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;

import '../components/zoom_text.dart';

class QuestionPage extends GetView<ThemeCtr> {
  QuestionPage({super.key, required this.questionSection});

  QuestionSection questionSection;

  @override
  Widget build(BuildContext context) {
    context.theme;
    return Scaffold(
      appBar:
          MyAppBar(title: questionSection.sectionName, showSettingIcon: false),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MySiezes.screenPaddingH,
            vertical: MySiezes.screenPaddingV),
        //  InteractiveViewer: this makes the list view respects ZoomText
        child: InteractiveViewer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ExpansionTile(
                  title: MyTexts.normal(
                      title: questionSection.sectionName,
                      size: Get.width * 0.07,
                      textAlign: TextAlign.center),
                  leading: Icon(Icons.list),
                  backgroundColor: Color.fromARGB(255, 228, 228, 228),
                  collapsedBackgroundColor: Color.fromARGB(255, 255, 255, 255),
                  iconColor: MyColors.primary(),
                  childrenPadding:
                      EdgeInsets.symmetric(horizontal: MySiezes.screenPaddingH),
                  children: getTopics(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getTopics() {
    return questionSection.topics
        .map(
          (e) => ExpansionTile(
            title: MyTexts.normal(
                title: e.header,
                size: Get.width * 0.06,
                textAlign: TextAlign.center),
            leading: Icon(Icons.list),
            backgroundColor: Color.fromARGB(255, 234, 234, 234),
            collapsedBackgroundColor: Color.fromARGB(255, 245, 245, 245),
            iconColor: MyColors.primary(),
            children: getNestedTopics(e),
          ),
        )
        .toList();
  }

  getNestedTopics(Topics topic) {
    return topic.nestedTopics
        .map((e) => Column(
              children: <Widget>[
                ExpansionTile(
                  title:
                      MyTexts.normal(title: e.title, textAlign: TextAlign.end),
                  leading: Icon(Icons.list),
                  backgroundColor: MyColors.background(),
                  collapsedBackgroundColor: MyColors.background(),
                  iconColor: MyColors.primary(),
                  children: [
                    ZoomText(
                      text: e.body,
                      color: Colors.black,
                      textAlign: (e.title == "فضل الدعوة إلى اللَّه" ||
                              e.title == "خطوات الدعوة ومهارات الداعية")
                          ? TextAlign.end
                          : TextAlign.start,
                    ),
                  ],
                ),
                Divider(),
              ],
            ))
        .toList();
  }
}
