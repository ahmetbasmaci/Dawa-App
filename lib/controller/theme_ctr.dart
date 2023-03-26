import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constents/my_colors.dart';
import '../constents/my_sizes.dart';

TextStyle titleSmall = GoogleFonts.lateef(fontSize: 22, height: 1.8, wordSpacing: 5.5, fontWeight: FontWeight.w500);
TextStyle titleLarge = GoogleFonts.lateef(
    fontSize: 22, height: 1.8, wordSpacing: 5.5, fontWeight: FontWeight.w500, color: MyColors.whiteBlackReversed());

TextStyle headlineSmall = GoogleFonts.harmattan(fontSize: 14);

TextStyle headlineMedium = GoogleFonts.harmattan(fontSize: 19, fontWeight: FontWeight.bold);

class ThemeCtr extends GetxController {
  ThemeCtr() {
    updateThemes();
  }
  RxBool isDarkMode = false.obs;
  Rx<ThemeData> lightThemeMode = ThemeData.light().obs;
  Rx<ThemeData> darkThemeMode = ThemeData.dark().obs;
  Rx<ThemeData> currentThemeMode = ThemeData().obs;

  updateThemes() {
    lightThemeMode.value = ThemeData.light().copyWith(
      listTileTheme: ListTileThemeData(
        selectedColor: MyColors.primary_,
        iconColor: MyColors.primary_,
        textColor: MyColors.black,
        selectedTileColor: MyColors.primary_.withOpacity(.8),
      ),
      scaffoldBackgroundColor: MyColors.backgroundLight,
      appBarTheme: AppBarTheme(
        color: MyColors.backgroundLight,
        iconTheme: IconThemeData(color: MyColors.primary_, size: MySiezes.icon * 1.2),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColors.primary_),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: MyColors.backgroundLight),
      iconTheme: IconThemeData(color: MyColors.primary_, size: MySiezes.icon),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: MyColors.primary_, elevation: 10),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.primary_),
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySiezes.blockRadius))),
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20, color: MyColors.white)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySiezes.blockRadius)))),
      ),
      indicatorColor: MyColors.primary_,
      bottomAppBarTheme: BottomAppBarTheme(color: MyColors.primary_),
      textTheme: TextTheme(
        titleSmall: titleSmall.copyWith(color: MyColors.black), //defaultText
        headlineSmall: headlineSmall.copyWith(color: MyColors.settingsContent),
        headlineMedium: headlineMedium.copyWith(color: MyColors.whiteBlack()),
        titleLarge: titleLarge,
      ),
      // colorScheme: ColorScheme(
      //   background: MyColors.backgroundLight,
      //   brightness: Brightness.light,
      //   error: Colors.red,
      //   primary: MyColors.primary_,
      //   secondary: Colors.blueGrey,
      //   surface: Colors.greenAccent,
      //   onBackground: Colors.yellow,
      //   onError: Colors.blue,
      //   onPrimary: Colors.pink,
      //   onSecondary: Colors.purple,
      //   onSurface: Colors.teal,
      // ),
    );
    darkThemeMode.value = ThemeData.dark().copyWith(
      timePickerTheme: TimePickerThemeData(dialHandColor: MyColors.primary()),
      primaryColor: MyColors.primaryDark,
      listTileTheme: ListTileThemeData(
        selectedColor: MyColors.primaryDark,
        iconColor: MyColors.primaryDark,
        textColor: MyColors.white,
        selectedTileColor: MyColors.primaryDark.withOpacity(.8),
      ),
      scaffoldBackgroundColor: MyColors.backgroundDark,
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.backgroundDark,
        iconTheme: IconThemeData(
          color: MyColors.primaryDark,
          size: MySiezes.icon,
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: MyColors.white,
        ),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: MyColors.backgroundDark),
      iconTheme: IconThemeData(color: MyColors.primaryDark, size: MySiezes.icon),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: MyColors.primaryDark, elevation: 10),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.primary_),
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySiezes.blockRadius))),
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20, color: MyColors.white)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySiezes.blockRadius)))),
      ),
      indicatorColor: MyColors.primaryDark,
      textTheme: TextTheme(
        //titleSmall: TextStyle(color: Colors.amber), //defaultText
        titleSmall: titleSmall.copyWith(color: MyColors.white),
        headlineSmall: headlineSmall.copyWith(color: Color.fromARGB(255, 123, 123, 123)),
        headlineMedium: headlineMedium.copyWith(color: MyColors.white),
        titleLarge: titleLarge,
      ),
    );
  }

  final _getStorage = GetStorage();
  final _darkKeyTheme = 'isDarkMode';

  void _saveThemeData(bool newThemeMode) => _getStorage.write(_darkKeyTheme, newThemeMode);

  bool _isSavedDarkMode() => _getStorage.read<bool>(_darkKeyTheme) ?? false;

  ThemeMode getThemeMode() => _isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;

  void changeThemeMode(bool isDarkMode) async {
    updateThemes();
    currentThemeMode.value = isDarkMode ? darkThemeMode.value : lightThemeMode.value;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    _saveThemeData(isDarkMode);
    this.isDarkMode.value = Get.isDarkMode;
  }
}
