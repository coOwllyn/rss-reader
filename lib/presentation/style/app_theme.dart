import 'package:err_rss_reader/presentation/style/app_colors.dart';
import 'package:err_rss_reader/presentation/style/app_text_style.dart';
import 'package:flutter/material.dart';

class FlutterTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: AppColors.bgLight,
        elevation: 0,
        titleTextStyle: getHeaderStyle(color: AppColors.blueMain, fontSize: 20),
      ),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: AppColors.white),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.red,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
