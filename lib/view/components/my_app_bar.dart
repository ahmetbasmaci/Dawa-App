import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constents/my_icons.dart';
import '../pages/settings_page.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key, required this.title, this.showSettingIcon = true});
  String title;
  bool showSettingIcon;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        showSettingIcon
            ? Padding(
                padding: EdgeInsets.only(left: Get.width * .05),
                child: IconButton(
                  onPressed: () => Get.to(SettingsPage()),
                  icon: MyIcons.settings(),
                ),
              )
            : Container(),
      ],
    );
  }
}
