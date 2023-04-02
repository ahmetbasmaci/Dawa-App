import 'package:alda3ia/constents/my_sizes.dart';
import 'package:alda3ia/controller/settings_ctr.dart';
import 'package:alda3ia/controller/theme_ctr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constents/my_icons.dart';

class MyAppBar extends GetView<ThemeCtr> implements PreferredSizeWidget {
  MyAppBar({super.key, required this.title, this.actions = const []});
  String title;
  List<Widget> actions;
  static final SettingsCtr _settingsCtr = Get.find<SettingsCtr>();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    context.theme;
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        ...actions,
        Padding(
          padding: EdgeInsets.only(left: Get.width * .05),
          child: IconButton(
            onPressed: () async {
              _settingsCtr.changeDarkModeState(!Get.isDarkMode);
              await Future.delayed(const Duration(milliseconds: 300));
              //setState(() {});
            },
            icon: MyIcons.animated_Light_Dark(size: MySizes.icon * 1.2),
          ),
        ),
      ],
    );
  }
}
