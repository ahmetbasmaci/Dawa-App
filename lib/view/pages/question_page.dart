// import 'package:flutter/material.dart';
import 'package:alda3ia/constents/my_colors.dart';
import 'package:alda3ia/constents/my_icons.dart';
import 'package:alda3ia/constents/my_texts.dart';
import 'package:alda3ia/model/models.dart';
import 'package:alda3ia/view/components/zoom_text.dart';
import 'package:alda3ia/view/pages/answer_page.dart';
import 'package:get/get.dart';
import 'package:alda3ia/view/components/my_app_bar.dart';
import '../../constents/my_sizes.dart';
import '../../controller/theme_ctr.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import '../components/copy_text.dart';

class QuestionPage extends GetView<ThemeCtr> {
  QuestionPage({super.key, required this.questionSection});

  QuestionSection questionSection;

  @override
  Widget build(BuildContext context) {
    context.theme;
    return Scaffold(
      appBar: MyAppBar(title: questionSection.sectionName),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: MySizes.screenPaddingH, vertical: MySizes.screenPaddingV),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...getTopics(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getTopics() {
    return questionSection.topics
        .map(
          (e) => Column(
            children: [
              ExpansionTile(
                title: MyTexts.normal(title: e.header, size: Get.width * 0.06, textAlign: TextAlign.center),
                leading: Icon(Icons.list),
                backgroundColor: MyColors.expansionTile(),
                collapsedBackgroundColor: MyColors.expansionTile(),
                iconColor: MyColors.primary(),
                children: getNestedTopics(e),
              ),
              Divider(height: 20, color: Colors.transparent),
            ],
          ),
        )
        .toList();
  }

  List<Widget> getNestedTopics(Topics topic) {
    return topic.nestedTopics.map(
      (e) {
        final lastIndex = topic.nestedTopics.indexOf(e) == topic.nestedTopics.length - 1;
        return Column(
          children: <Widget>[
            Divider(height: 20, thickness: 20, color: Colors.transparent),
            ElevatedButton(
              onPressed: () => Get.to(AnswerPage(title: e.title, body: e.body)),
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: MyIcons.rightArrow(color: Colors.white),
                      color: MyColors.primary(),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: <Widget>[
                        MyTexts.normal(title: e.title, textAlign: TextAlign.center, color: MyColors.white)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            lastIndex ? Divider(height: 20, thickness: 20, color: Colors.transparent) : Container(),
          ],
        );
      },
    ).toList();
  }
}
