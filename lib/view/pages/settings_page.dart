import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alda3ia/view/components/my_app_bar.dart';
import '../../constents/my_icons.dart';
import '../../constents/my_sizes.dart';
import '../../constents/my_texts.dart';
import '../../controller/settings_ctr.dart';
import '../components/my_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String id = 'SettingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static final SettingsCtr _settingsCtr = Get.find<SettingsCtr>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: 'الإعدادات'),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: MyTexts.settingsTitle(title: 'تنشيط الوضع اليلي'),
                  subtitle: MyTexts.settingsContent(title: 'انقر هنا لاختيار الوضع اليلي'),
                  trailing: MySwitch(
                      value: Get.isDarkMode,
                      onChanged: (newValue) async {
                        _settingsCtr.changeDarkModeState(newValue);
                        await Future.delayed(const Duration(milliseconds: 300));
                        setState(() {});
                      }),
                  leading: MyIcons.animated_Light_Dark(size: MySizes.icon * 1.2),
                ),
                Divider(),
                // Obx(
                //   () => ListTile(
                //     title: MyTexts.settingsTitle(title: 'تشفيل صوت الاحوبة'),
                //     subtitle: MyTexts.settingsContent(title: 'عند تفعيل هذا الخيار سيتم تشفيل الصوت'),
                //     trailing: MySwitch(
                //       value: _settingsCtr.isSoundOn.value,
                //       onChanged: (newValue) => _settingsCtr.changeNotificationSoundMode(newValue),
                //     ),
                //     leading: MyIcons.animatedSound_On_Of(size: MySiezes.icon * 1.2),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
