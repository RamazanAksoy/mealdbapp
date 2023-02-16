import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static final darkTheme = ThemeData(
    primaryColor: AppColors.main,
  );

  static final lightTheme = ThemeData(
    primaryColor: AppColors.themeColor,
    colorScheme: ColorScheme.light(primary: AppColors.themeColor),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.main),
  );
}
