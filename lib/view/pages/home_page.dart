import 'package:alda3ia/model/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alda3ia/constents/my_sizes.dart';
import 'package:alda3ia/helper/json_service.dart';
import 'package:alda3ia/view/components/my_app_bar.dart';
import 'package:alda3ia/view/components/my_circular_progress_indecator.dart';
import 'package:alda3ia/view/pages/question_page.dart';

import '../../controller/question_data_ctr.dart';

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
      appBar: MyAppBar(title: "alda3ia"),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySiezes.blockRadius)),
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
