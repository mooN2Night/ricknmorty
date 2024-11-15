import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';

List<Widget> getTextPair(
  BuildContext context,
  String helperText,
  String mainText,
) {
  return [
    AppConstants.mainTextPadding,
    Text(
      helperText,
      style: Theme.of(context).textTheme.labelMedium,
      textAlign: TextAlign.center,
    ),
    AppConstants.helperTextPadding,
    Text(
      mainText,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    ),
  ];
}
