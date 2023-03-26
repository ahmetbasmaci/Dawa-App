import 'dart:convert';
import 'package:alda3ia/controller/question_data_ctr.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class JsonService {
  static final QuestionDataCtr _questionData = Get.find<QuestionDataCtr>();

  static Future loadData() async {
    await loadQestions();
  }

  static Future loadQestions() async {
    if (_questionData.isEmpty) {
      String jsonString = await rootBundle.loadString('assets/json/file.json');
      List data = json.decode(jsonString);
      _questionData.addData(data);
    }
    return true;
  }
}
