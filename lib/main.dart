import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constents/constents.dart';
import 'controller/theme_ctr.dart';
import 'helper/controllers_binging.dart';
import 'view/pages/home_page.dart';
import 'view/pages/settings_page.dart';
import 'view/pages/splash_page.dart';
void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeCtr());
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SqlDb().deleteDB();

    return GetMaterialApp(
      initialBinding: ControllersBinding(),
      navigatorKey: Constants.navigatorKey,
      // supportedLocales: [const Locale('ar')],
      locale: Locale('en'),
      routes: {
        HomePage.id: (context) => HomePage(), //'/${HomePage.id}'
        SettingsPage.id: (context) => SettingsPage(),
        SplashPage.id: (context) => SplashPage(),
      },
      // home: DebouncedSearchBar(),
//      initialRoute: Constants.isInDebugMode ? HomePage.id : SplashPage.id,
      initialRoute: SplashPage.id,
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeCtr>().lightThemeMode.value,
      darkTheme: Get.find<ThemeCtr>().darkThemeMode.value,
      themeMode: Get.find<ThemeCtr>().getThemeMode(),
    );
  }
}
