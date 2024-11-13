import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';

class ThemeConstants {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppConstants.darkScaffoldBackground,
    appBarTheme: _appBarTheme(true),
    colorScheme: const ColorScheme.dark(
      background: AppConstants.blackColor,
      primary: AppConstants.greyColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppConstants.whiteColor),
      trackColor: MaterialStateProperty.all(AppConstants.trackColor),
      trackOutlineColor: MaterialStateProperty.all(AppConstants.whiteColor),
      trackOutlineWidth:
          MaterialStateProperty.all(AppConstants.trackOutlineWidth),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppConstants.whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppConstants.whiteColor,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(
        color: AppConstants.whiteColor,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: AppConstants.whiteColor,
        fontSize: 13,
        fontWeight: FontWeight.w200,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppConstants.lightScaffoldBackground,
    appBarTheme: _appBarTheme(false),
    colorScheme: const ColorScheme.light(
      background: AppConstants.whiteColor,
      primary: AppConstants.greyColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppConstants.blackColor),
      trackColor: MaterialStateProperty.all(AppConstants.trackColor),
      trackOutlineWidth:
          MaterialStateProperty.all(AppConstants.trackOutlineWidth),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppConstants.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: AppConstants.blackColor,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(
        color: AppConstants.blackColor,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: AppConstants.blackColor,
        fontSize: 13,
        fontWeight: FontWeight.w200,
      ),
    ),
  );

  static AppBarTheme _appBarTheme(bool isDark) {
    return AppBarTheme(
      elevation: 1,
      shadowColor: isDark ? AppConstants.whiteColor : AppConstants.greyColor,
      backgroundColor:
          isDark ? AppConstants.blackColor : AppConstants.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.appbarBorderRadius),
          bottomRight: Radius.circular(AppConstants.appbarBorderRadius),
        ),
      ),
    );
  }
}
