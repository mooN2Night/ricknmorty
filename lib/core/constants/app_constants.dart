import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl = 'https://rickandmortyapi.com/api/';

  static const String cachePersonKey = 'CACHED_PERSON_KEY';

  static const String serverFailure = 'Server Failure';
  static const String cacheFailure = 'Cache Failure';
  static const String unexpectedFailure = 'Unexpected Error';

  static const Color darkScaffoldBackground = Color(0xFF36454F);
  static const Color lightScaffoldBackground = Color(0xFFFFFDD0);
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;
  static const Color whiteColor = Colors.white;
  static const Color trackColor = Color(0xFFb4b4b4);

  static const double trackOutlineWidth = 1;
  static const double appbarBorderRadius = 15;
}
