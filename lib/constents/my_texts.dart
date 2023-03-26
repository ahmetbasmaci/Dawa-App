import 'package:flutter/material.dart';
import 'constents.dart';

class MyTexts {
  static BuildContext context = Constants.navigatorKey.currentState!.context;
  static Text normal(
      {required String title, Color? color, double? size, FontWeight? fontWeight, TextAlign? textAlign}) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }

  static Text button({required String title, Color? color, double? size, FontWeight? fontWeight}) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }

  static Text settingsTitle({required String title, Color? color, double? size}) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: color, fontSize: size),
    );
  }

  static Text settingsContent({required String title}) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
