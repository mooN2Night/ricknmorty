import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';

class ThemeConstants {
  static ThemeData mainDarkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppConstants.darkScaffoldBackground,
    appBarTheme: _mainAppBarTheme(true),
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

  static ThemeData mainLightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppConstants.lightScaffoldBackground,
    appBarTheme: _mainAppBarTheme(false),
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

  static ThemeData searchDarkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppConstants.darkScaffoldBackground,
    appBarTheme: _mainAppBarTheme(true),
    colorScheme: const ColorScheme.dark(
      background: AppConstants.blackColor,
      primary: AppConstants.greyColor,
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
    hintColor: AppConstants.whiteColor,
  );

  static ThemeData searchLightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppConstants.lightScaffoldBackground,
    appBarTheme: _mainAppBarTheme(false),
    colorScheme: const ColorScheme.light(
      background: AppConstants.whiteColor,
      primary: AppConstants.greyColor,
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
    hintColor: AppConstants.blackColor,
  );

  static AppBarTheme _mainAppBarTheme(bool isDark) {
    return AppBarTheme(
      elevation: 2,
      scrolledUnderElevation: 5,
      shadowColor: isDark ? AppConstants.whiteColor : AppConstants.blackColor,
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
