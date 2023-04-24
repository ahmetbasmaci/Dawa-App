import 'dart:math';

import 'package:alda3ia/model/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alda3ia/constents/my_sizes.dart';
import 'package:alda3ia/helper/json_service.dart';
import 'package:alda3ia/view/components/my_app_bar.dart';
import 'package:alda3ia/view/components/my_circular_progress_indecator.dart';
import 'package:alda3ia/view/pages/question_page.dart';
import 'package:search_page/search_page.dart';

import '../../constents/my_colors.dart';
import '../../constents/my_texts.dart';
import '../../controller/question_data_ctr.dart';
import 'answer_page.dart';

class HomePage extends StatefulWidget {
  static const id = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final QuestionDataCtr questionData = Get.find<QuestionDataCtr>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Alda3ia",
        actions: [
          IconButton(
            onPressed: () {
              List<NestedTopics> nestedTopics = [];
              for (var element in questionData.questionSections) {
                for (var element in element.topics) {
                  nestedTopics.addAll(element.nestedTopics);
                }
              }
              showSearch(
                context: context,
                delegate: SearchPage<NestedTopics>(
                  searchLabel: 'البحث',
                  searchStyle: TextStyle(color: MyColors.whiteBlack()),
                  builder: (section) => Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: MyColors.shadowPrimary()),
                      ),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        onTap: () {
                          Get.to(
                            AnswerPage(title: section.title, body: section.body),
                          );
                        },
                        title: MyTexts.normal(
                          title: section.title,
                          size: min(Get.width * .05, 24),
                        ),
                      ),
                    ),
                  ),
                  filter: (section) {
                    return [section.body, section.title];
                  },
                  items: nestedTopics,
                ),
              );
            },
            icon: Icon(
              Icons.search,
              size: 26,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: JsonService.loadQestions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //childAspectRatio: 2.5,
                  crossAxisSpacing: Get.width * 0.02,
                  mainAxisSpacing: Get.height * 0.02,
                  //mainAxisExtent: 650,
                ),
                children: [
                  ...getButtonCards(),
                ],
              ),
            );
          } else
            return MyCircularProgressIndecator();
        },
      ),
    );
  }

  List<Widget> getButtonCards() {
    List<Widget> list = [];
    for (var section in questionData.questionSections) {
      list.add(buttondCard(section));
    }

    return list;
  }

  Widget buttondCard(QuestionSection questionSection) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySizes.blockRadius)),
      ),
      onPressed: () {
        Get.to(QuestionPage(questionSection: questionSection));
      },
      child: Text(
        questionSection.sectionName,
        textAlign: TextAlign.center,
      ),
    );
  }
}
