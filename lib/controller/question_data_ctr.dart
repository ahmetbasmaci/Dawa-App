import 'dart:math';
import 'package:get/get.dart';
import 'package:alda3ia/helper/enums.dart';

import '../model/models.dart';

class QuestionDataCtr extends GetxController {
  final List<QuestionSection> _questionSections = [];
  bool get isEmpty => _questionSections.isEmpty;
  bool get isNotEmpty => _questionSections.isNotEmpty;
  List<QuestionSection> get questionSections => _questionSections;

  void addData(List data) {
    for (var element in data) {
      _questionSections.add(QuestionSection.fromJson(element));
    }
  }

  QuestionSection getQuestionSectionByType(SectionType sectionType) {
    List<QuestionSection> questions = [];
    for (var element in _questionSections) {
      if (element.sectionType == sectionType) {
        questions.add(element);
        break;
      }
    }
    int randomIndex = Random().nextInt(questions.length);
    return questions[randomIndex];
  }
}
