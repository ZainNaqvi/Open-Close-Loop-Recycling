import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/themes/themes.dart';

enum ThemeType { Light, Dark }

class ThemeModel extends GetxController {
  ThemeData currentTheme = AppTheme.lightTheme;
  ThemeType _themeType = ThemeType.Light;

  toggleTheme() {
    if (_themeType == ThemeType.Dark) {
      currentTheme = AppTheme.lightTheme;
      _themeType = ThemeType.Light;
      return update();
    } else {
      currentTheme = AppTheme.darkTheme;
      _themeType = ThemeType.Dark;
      return update();
    }
  }
}
