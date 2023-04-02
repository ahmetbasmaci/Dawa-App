import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyColors {
  static const Color backgroundLight = Color(0xffdbe2e7);
  static const Color backgroundDark = Color.fromARGB(255, 33, 33, 33);
  static Color primary_ = Color.fromARGB(255, 38, 65, 132);
  static Color primaryDark = Color.fromARGB(255, 64, 97, 181);
  static const Color lightModeShadow = Color.fromARGB(255, 63, 63, 63);
  static const Color second_ = Color.fromARGB(255, 223, 40, 40);
  static const Color secondDark = Color.fromARGB(255, 223, 40, 40);
  static const Color content = Color.fromARGB(255, 0, 0, 0);
  static const Color contentDark = Color.fromARGB(255, 255, 255, 255);
  static const Color settingsTitle = Color(0xff000000);
  static const Color settingsContent = Color.fromARGB(255, 59, 59, 59);
  static const Color settingsContentDark = Color(0xff7f8081);
  static const Color white = Color(0xffffffff);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color _zikrCardDark = Color(0xff293539);
  static const Color _zikrCard = Color.fromARGB(255, 243, 243, 243);
  static const Color _trueDark = Color.fromARGB(255, 37, 159, 53);
  static const Color true_ = Color.fromARGB(255, 19, 85, 16);
  static const Color false_ = Color.fromARGB(255, 203, 40, 40);

  static Color background() => Get.isDarkMode ? backgroundDark : backgroundLight;

  static Color whiteBlack() => Get.isDarkMode ? white : black;
  static Color whiteBlackReversed() => Get.isDarkMode ? black : white;

  static Color quranStatus() => Get.isDarkMode ? Color.fromARGB(255, 0, 0, 0) : Color.fromARGB(255, 210, 195, 174);

  static Color expansionTile() => Get.isDarkMode ? Color.fromARGB(255, 29, 29, 29) : Color.fromARGB(255, 204, 211, 220);
  static Color primary() => Get.isDarkMode ? primaryDark : primary_;

  static Color currect() => Get.isDarkMode ? _trueDark : true_;

  static Color second() => Get.isDarkMode ? secondDark : second_;

  static Color shadow() => Get.isDarkMode ? black : black;

  static Color zikrCard() => Get.isDarkMode ? _zikrCardDark : _zikrCard;
  static Color zikrCard2() => Get.isDarkMode ? MyColors.black : MyColors.lightModeShadow;

  static Color shadowPrimary() => Get.isDarkMode ? primaryDark : primary_;
}
