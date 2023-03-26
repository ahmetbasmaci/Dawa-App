//import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import '../controller/settings_ctr.dart';
import '../controller/theme_ctr.dart';
import '../controller/question_data_ctr.dart';

class ControllersBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ThemeCtr());
    Get.put(SettingsCtr());
    Get.put(QuestionDataCtr());
    // AudioCache audioCache = AudioCache();
    // await audioCache.load('sounds/correct.mp3');
    // await audioCache.load('sounds/wrong.mp3');
  }
}
