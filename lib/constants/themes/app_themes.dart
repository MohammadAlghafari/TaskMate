import 'package:flutter/material.dart';
import 'package:tasks_board/constants/colors/colors.dart';

// App Theme Style

class AppThemes {
  // This is theme for app
  static ThemeData appTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(color: AppColors.whiteColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.whiteColor,
  );
}
