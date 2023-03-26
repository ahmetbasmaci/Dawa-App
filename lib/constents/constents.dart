import 'package:flutter/material.dart';
class Constants {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // Create a key to can open drawer
  //to check if in debbug mode or not
  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }


  /// Convert a number to arabic number
  static convertToArabicNumber(int ayahNumber) {
    String arabicNumber = ayahNumber.toString();
    arabicNumber = arabicNumber.replaceAll('0', '٠');
    arabicNumber = arabicNumber.replaceAll('1', '١');
    arabicNumber = arabicNumber.replaceAll('2', '٢');
    arabicNumber = arabicNumber.replaceAll('3', '٣');
    arabicNumber = arabicNumber.replaceAll('4', '٤');
    arabicNumber = arabicNumber.replaceAll('5', '٥');
    arabicNumber = arabicNumber.replaceAll('6', '٦');
    arabicNumber = arabicNumber.replaceAll('7', '٧');
    arabicNumber = arabicNumber.replaceAll('8', '٨');
    arabicNumber = arabicNumber.replaceAll('9', '٩');
    return arabicNumber;
  }
}
